package kimdong.vn.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kimdong.vn.service.IUserService;
import kimdong.vn.service.impl.UserServiceImpl;
import java.io.IOException;

@WebServlet(urlPatterns = "/verify-otp")
public class VerifyOtpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IUserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/verify-otp.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String email = (String) session.getAttribute("emailVerify");
		String otp = req.getParameter("otp");

		if (userService.verifyOtp(email, otp)) {
			String type = (String) session.getAttribute("verifyType");
			if ("FORGOT_PASS".equals(type)) {
				resp.sendRedirect(req.getContextPath() + "/reset-password");
			} else {
				req.setAttribute("message", "Kích hoạt tài khoản thành công! Hãy đăng nhập.");
				req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
			}
		} else {
			req.setAttribute("error", "Mã OTP không đúng hoặc đã hết hạn!");
			req.getRequestDispatcher("/views/web/verify-otp.jsp").forward(req, resp);
		}
	}
}