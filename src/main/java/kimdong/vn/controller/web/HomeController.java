package kimdong.vn.controller.web;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kimdong.vn.entity.Product;
import kimdong.vn.service.IProductService;
import kimdong.vn.service.impl.ProductServiceImpl;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/home" })
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// Hiển thị 10 sản phẩm mới nhất lên trang chủ
		List<Product> top10 = productService.getTop10Latest();
		req.setAttribute("top10Products", top10);
		req.getRequestDispatcher("/views/web/home.jsp").forward(req, resp);
	}
}