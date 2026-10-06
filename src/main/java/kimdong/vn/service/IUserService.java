package kimdong.vn.service;

import kimdong.vn.entity.User;

public interface IUserService {
	boolean register(User user);

	boolean verifyOtp(String email, String otp);

	boolean forgotPassword(String email);

	boolean resetPassword(String email, String newPassword);

	User login(String username, String password);
}