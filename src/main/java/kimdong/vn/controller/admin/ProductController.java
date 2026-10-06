package kimdong.vn.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import kimdong.vn.entity.Product;
import kimdong.vn.service.ICategoryService;
import kimdong.vn.service.IProductService;
import kimdong.vn.service.impl.CategoryServiceImpl;
import kimdong.vn.service.impl.ProductServiceImpl;
import kimdong.vn.util.Constant;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = { "/admin/products", "/admin/product/add", "/admin/product/insert", "/admin/product/edit",
		"/admin/product/update", "/admin/product/delete" })
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final IProductService productService = new ProductServiceImpl();
	private final ICategoryService categoryService = new CategoryServiceImpl();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		if (url.contains("/admin/products")) {
			List<Product> list = productService.findAll();
			req.setAttribute("products", list);
			req.getRequestDispatcher("/views/admin/product-list.jsp").forward(req, resp);
		} else if (url.contains("/admin/product/add")) {
			req.setAttribute("categories", categoryService.findAll());
			req.getRequestDispatcher("/views/admin/product-add.jsp").forward(req, resp);
		} else if (url.contains("/admin/product/edit")) {
			int id = Integer.parseInt(req.getParameter("id"));
			Product product = productService.findById(id);
			req.setAttribute("product", product);
			req.setAttribute("categories", categoryService.findAll());
			req.getRequestDispatcher("/views/admin/product-edit.jsp").forward(req, resp);
		} else if (url.contains("/admin/product/delete")) {
			int id = Integer.parseInt(req.getParameter("id"));
			productService.delete(id);
			resp.sendRedirect(req.getContextPath() + "/admin/products");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURI();
		File uploadFolder = new File(Constant.UPLOAD_DIR);
		if (!uploadFolder.exists())
			uploadFolder.mkdirs();

		if (url.contains("/admin/product/insert")) {
			String name = req.getParameter("productName");
			double price = Double.parseDouble(req.getParameter("price"));
			String desc = req.getParameter("description");
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));
			String linkImages = req.getParameter("images");

			Product p = new Product();
			p.setProductName(name);
			p.setPrice(price);
			p.setDescription(desc);
			p.setCategory(categoryService.findById(categoryId));

			Part part = req.getPart("imageFile");
			if (part != null && part.getSize() > 0) {
				String fname = System.currentTimeMillis()
						+ Paths.get(part.getSubmittedFileName()).getFileName().toString();
				part.write(Constant.UPLOAD_DIR + File.separator + fname);
				p.setImages(fname);
			} else if (linkImages != null && !linkImages.trim().isEmpty()) {
				p.setImages(linkImages);
			} else {
				p.setImages(Constant.DEFAULT_AVATAR);
			}

			productService.insert(p);
			resp.sendRedirect(req.getContextPath() + "/admin/products");
		} else if (url.contains("/admin/product/update")) {
			int id = Integer.parseInt(req.getParameter("productId"));
			String name = req.getParameter("productName");
			double price = Double.parseDouble(req.getParameter("price"));
			String desc = req.getParameter("description");
			int categoryId = Integer.parseInt(req.getParameter("categoryId"));
			String linkImages = req.getParameter("images");

			Product p = productService.findById(id);
			p.setProductName(name);
			p.setPrice(price);
			p.setDescription(desc);
			p.setCategory(categoryService.findById(categoryId));

			Part part = req.getPart("imageFile");
			if (part != null && part.getSize() > 0) {
				String fname = System.currentTimeMillis()
						+ Paths.get(part.getSubmittedFileName()).getFileName().toString();
				part.write(Constant.UPLOAD_DIR + File.separator + fname);
				p.setImages(fname);
			} else if (linkImages != null && !linkImages.trim().isEmpty()) {
				p.setImages(linkImages);
			}

			productService.update(p);
			resp.sendRedirect(req.getContextPath() + "/admin/products");
		}
	}
}