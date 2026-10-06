package kimdong.vn.service.impl;

import kimdong.vn.dao.ICategoryDao;
import kimdong.vn.dao.impl.CategoryDaoImpl;
import kimdong.vn.entity.Category;
import kimdong.vn.service.ICategoryService;
import java.util.List;

public class CategoryServiceImpl implements ICategoryService {
	private final ICategoryDao cateDao = new CategoryDaoImpl();

	@Override
	public List<Category> findAll() {
		return cateDao.findAll();
	}

	@Override
	public Category findById(int id) {
		return cateDao.findById(id);
	}

	@Override
	public List<Category> searchByName(String keyword) {
		return cateDao.searchByName(keyword);
	}

	@Override
	public void insert(Category category) {
		if (cateDao.findByCategoryname(category.getCategoryName()) == null) {
			cateDao.insert(category);
		}
	}

	@Override
	public void update(Category category) {
		if (cateDao.findById(category.getCategoryId()) != null) {
			cateDao.update(category);
		}
	}

	@Override
	public void delete(int id) {
		try {
			cateDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int count() {
		return cateDao.count();
	}

	@Override
	public List<Category> findAll(int page, int pagesize) {
		return cateDao.findAll(page, pagesize);
	}

	@Override
	public Category findByCategoryname(String name) {
		return cateDao.findByCategoryname(name);
	}
}