package kimdong.vn.dao;

import kimdong.vn.entity.Product;
import java.util.List;

public interface IProductDao {
	void insert(Product product);

	void update(Product product);

	void delete(int id) throws Exception;

	Product findById(int id);

	List<Product> findAll();

	List<Product> getTop10Latest();

	List<Product> findAllPaged(int page, int pageSize);

	long count();
}