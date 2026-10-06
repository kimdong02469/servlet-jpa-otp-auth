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

@WebServlet(urlPatterns = { "/forgot-password", "/reset-password" })
public class ForgotPasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IUserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getRequestURI().contains("/forgot-password")) {
			req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
		} else {
			req.getRequestDispatcher("/views/web/reset-password.jsp").forward(req, resp);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if (req.getRequestURI().contains("/forgot-password")) {
			String email = req.getParameter("email");
			if (userService.forgotPassword(email)) {
				HttpSession session = req.getSession();
				session.setAttribute("emailVerify", email);
				session.setAttribute("verifyType", "FORGOT_PASS");
				resp.sendRedirect(req.getContextPath() + "/verify-otp");
			} else {
				req.setAttribute("error", "Email không tồn tại trong hệ thống!");
				req.getRequestDispatcher("/views/web/forgot-password.jsp").forward(req, resp);
			}
		} else if (req.getRequestURI().contains("/reset-password")) {
			HttpSession session = req.getSession();
			String email = (String) session.getAttribute("emailVerify");
			String newPass = req.getParameter("newPassword");
			userService.resetPassword(email, newPass);
			session.removeAttribute("emailVerify");
			resp.sendRedirect(req.getContextPath() + "/login");
		}
	}
}