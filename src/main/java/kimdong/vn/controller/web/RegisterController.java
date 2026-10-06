package kimdong.vn.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kimdong.vn.entity.User;
import kimdong.vn.service.IUserService;
import kimdong.vn.service.impl.UserServiceImpl;
import java.io.IOException;

@WebServlet(urlPatterns = "/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IUserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = new User();
		user.setUsername(req.getParameter("username"));
		user.setPassword(req.getParameter("password"));
		user.setEmail(req.getParameter("email"));
		user.setFullname(req.getParameter("fullname"));
		user.setPhone(req.getParameter("phone"));

		if (userService.register(user)) {
			HttpSession session = req.getSession();
			session.setAttribute("emailVerify", user.getEmail());
			session.setAttribute("verifyType", "REGISTER");
			resp.sendRedirect(req.getContextPath() + "/verify-otp");
		} else {
			req.setAttribute("error", "Username hoặc Email đã được sử dụng!");
			req.getRequestDispatcher("/views/web/register.jsp").forward(req, resp);
		}
	}
}