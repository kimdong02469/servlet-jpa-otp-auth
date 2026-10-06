package kimdong.vn.service.impl;

import kimdong.vn.dao.IProductDao;
import kimdong.vn.dao.impl.ProductDaoImpl;
import kimdong.vn.entity.Product;
import kimdong.vn.service.IProductService;
import java.util.List;

public class ProductServiceImpl implements IProductService {
	private final IProductDao productDao = new ProductDaoImpl();

	@Override
	public void insert(Product product) {
		productDao.insert(product);
	}

	@Override
	public void update(Product product) {
		productDao.update(product);
	}

	@Override
	public void delete(int id) {
		try {
			productDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Product findById(int id) {
		return productDao.findById(id);
	}

	@Override
	public List<Product> findAll() {
		return productDao.findAll();
	}

	@Override
	public List<Product> getTop10Latest() {
		return productDao.getTop10Latest();
	}

	@Override
	public List<Product> findAllPaged(int page, int pageSize) {
		return productDao.findAllPaged(page, pageSize);
	}

	@Override
	public long count() {
		return productDao.count();
	}
}