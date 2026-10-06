package kimdong.vn.service.impl;

import kimdong.vn.dao.IUserDao;
import kimdong.vn.dao.impl.UserDaoImpl;
import kimdong.vn.entity.User;
import kimdong.vn.service.IUserService;
import kimdong.vn.util.EmailUtil;
import java.time.LocalDateTime;
import java.util.Random;

public class UserServiceImpl implements IUserService {
	private final IUserDao userDao = new UserDaoImpl();

	@Override
	public boolean register(User user) {
		if (userDao.findByUsername(user.getUsername()) != null || userDao.findByEmail(user.getEmail()) != null) {
			return false;
		}
		String otp = String.format("%06d", new Random().nextInt(999999));
		user.setOtp(otp);
		user.setOtpGeneratedTime(LocalDateTime.now());
		user.setActive(false);
		user.setRoleid(2); // Role 2: User thông thường

		userDao.insert(user);
		try {
			EmailUtil.sendOtpEmail(user.getEmail(), otp);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}

	@Override
	public boolean verifyOtp(String email, String otp) {
		User user = userDao.findByEmail(email);
		if (user != null && otp != null && otp.equals(user.getOtp())) {
			// Kiểm tra OTP còn hạn 5 phút
			if (user.getOtpGeneratedTime().plusMinutes(5).isAfter(LocalDateTime.now())) {
				user.setActive(true);
				user.setOtp(null);
				userDao.update(user);
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean forgotPassword(String email) {
		User user = userDao.findByEmail(email);
		if (user != null) {
			String otp = String.format("%06d", new Random().nextInt(999999));
			user.setOtp(otp);
			user.setOtpGeneratedTime(LocalDateTime.now());
			userDao.update(user);
			try {
				EmailUtil.sendOtpEmail(user.getEmail(), otp);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	@Override
	public boolean resetPassword(String email, String newPassword) {
		User user = userDao.findByEmail(email);
		if (user != null) {
			user.setPassword(newPassword);
			userDao.update(user);
			return true;
		}
		return false;
	}

	@Override
	public User login(String username, String password) {
		User user = userDao.findByUsername(username);
		if (user != null && user.getPassword().equals(password) && user.isActive()) {
			return user;
		}
		return null;
	}
}