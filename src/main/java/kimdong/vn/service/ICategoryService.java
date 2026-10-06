package kimdong.vn.service;

import kimdong.vn.entity.Category;
import java.util.List;

public interface ICategoryService {
	void insert(Category category);

	void update(Category category);

	void delete(int id);

	Category findById(int id);

	Category findByCategoryname(String name);

	List<Category> findAll();

	List<Category> searchByName(String keyword);

	List<Category> findAll(int page, int pagesize);

	int count();
}