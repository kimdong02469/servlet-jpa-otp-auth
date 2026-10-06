package kimdong.vn.service;

import kimdong.vn.entity.Product;
import java.util.List;

public interface IProductService {
	void insert(Product product);

	void update(Product product);

	void delete(int id);

	Product findById(int id);

	List<Product> findAll();

	List<Product> getTop10Latest();

	List<Product> findAllPaged(int page, int pageSize);

	long count();
}