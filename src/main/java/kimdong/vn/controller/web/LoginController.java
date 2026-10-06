package kimdong.vn.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kimdong.vn.entity.User;
import kimdong.vn.service.IUserService;
import kimdong.vn.service.impl.UserServiceImpl;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IUserService userService = new UserServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user = req.getParameter("username");
		String pass = req.getParameter("password");
		String remember = req.getParameter("remember");

		User u = userService.login(user, pass);
		if (u != null) {
			HttpSession session = req.getSession();
			session.setAttribute("account", u);

			if ("on".equals(remember)) {
				Cookie cookie = new Cookie("username", user);
				cookie.setMaxAge(60 * 60 * 24); // 24h
				resp.addCookie(cookie);
			}

			if (u.getRoleid() == 1) {
				resp.sendRedirect(req.getContextPath() + "/admin/categories");
			} else {
				resp.sendRedirect(req.getContextPath() + "/home");
			}
		} else {
			req.setAttribute("error", "Tài khoản chưa kích hoạt hoặc sai thông tin đăng nhập!");
			req.getRequestDispatcher("/views/web/login.jsp").forward(req, resp);
		}
	}
}