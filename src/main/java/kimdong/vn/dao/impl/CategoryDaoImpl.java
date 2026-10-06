package kimdong.vn.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import kimdong.vn.config.JpaConfig;
import kimdong.vn.dao.ICategoryDao;
import kimdong.vn.entity.Category;
import java.util.List;

public class CategoryDaoImpl implements ICategoryDao {
	@Override
	public void insert(Category category) {
		EntityManager em = JpaConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(category);
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public void update(Category category) {
		EntityManager em = JpaConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.merge(category);
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public void delete(int cateid) throws Exception {
		EntityManager em = JpaConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			Category category = em.find(Category.class, cateid);
			if (category != null) {
				em.remove(category);
			} else {
				throw new Exception("Không tìm thấy danh mục");
			}
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public Category findById(int cateid) {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			return em.find(Category.class, cateid);
		} finally {
			em.close();
		}
	}

	@Override
	public Category findByCategoryname(String name) {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			String jpql = "SELECT c FROM Category c WHERE c.categoryName = :name";
			TypedQuery<Category> query = em.createQuery(jpql, Category.class);
			query.setParameter("name", name);
			List<Category> list = query.getResultList();
			return list.isEmpty() ? null : list.get(0);
		} finally {
			em.close();
		}
	}

	@Override
	public List<Category> findAll() {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			return em.createNamedQuery("Category.findAll", Category.class).getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Category> searchByName(String keyword) {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			String jpql = "SELECT c FROM Category c WHERE c.categoryName LIKE :catname";
			TypedQuery<Category> query = em.createQuery(jpql, Category.class);
			query.setParameter("catname", "%" + keyword + "%");
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Category> findAll(int page, int pagesize) {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			TypedQuery<Category> query = em.createNamedQuery("Category.findAll", Category.class);
			query.setFirstResult(page * pagesize);
			query.setMaxResults(pagesize);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public int count() {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			Long c = em.createQuery("SELECT COUNT(c) FROM Category c", Long.class).getSingleResult();
			return c.intValue();
		} finally {
			em.close();
		}
	}
}