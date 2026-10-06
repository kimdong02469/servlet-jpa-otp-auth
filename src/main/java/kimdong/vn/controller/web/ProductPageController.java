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

@WebServlet(urlPatterns = { "/product", "/product/detail" })
public class ProductPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IProductService productService = new ProductServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uri = req.getRequestURI();
		if (uri.endsWith("/product")) {
			// Phân trang 6 sản phẩm/trang
			int page = 1;
			int pageSize = 6;
			String pageStr = req.getParameter("page");
			if (pageStr != null) {
				try {
					page = Integer.parseInt(pageStr);
				} catch (Exception ignored) {
				}
			}

			List<Product> list = productService.findAllPaged(page, pageSize);
			long total = productService.count();
			int totalPages = (int) Math.ceil((double) total / pageSize);

			req.setAttribute("products", list);
			req.setAttribute("currentPage", page);
			req.setAttribute("totalPages", totalPages);
			req.getRequestDispatcher("/views/web/products.jsp").forward(req, resp);
		} else if (uri.endsWith("/product/detail")) {
			int id = Integer.parseInt(req.getParameter("id"));
			Product p = productService.findById(id);
			req.setAttribute("product", p);
			req.getRequestDispatcher("/views/web/product-detail.jsp").forward(req, resp);
		}
	}
}