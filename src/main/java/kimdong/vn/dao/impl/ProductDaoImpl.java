package kimdong.vn.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import kimdong.vn.config.JpaConfig;
import kimdong.vn.dao.IProductDao;
import kimdong.vn.entity.Product;
import java.util.List;

public class ProductDaoImpl implements IProductDao {
	@Override
	public void insert(Product product) {
		EntityManager em = JpaConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.persist(product);
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public void update(Product product) {
		EntityManager em = JpaConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			em.merge(product);
			trans.commit();
		} catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}

	@Override
	public void delete(int id) throws Exception {
		EntityManager em = JpaConfig.getEntityManager();
		EntityTransaction trans = em.getTransaction();
		try {
			trans.begin();
			Product p = em.find(Product.class, id);
			if (p != null) {
				em.remove(p);
			} else {
				throw new Exception("Không tìm thấy sản phẩm");
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
	public Product findById(int id) {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			return em.find(Product.class, id);
		} finally {
			em.close();
		}
	}

	@Override
	public List<Product> findAll() {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			return em.createNamedQuery("Product.findAll", Product.class).getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Product> getTop10Latest() {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			// Dùng JOIN FETCH p.category để truy vấn luôn danh mục
			TypedQuery<Product> query = em.createQuery(
					"SELECT p FROM Product p JOIN FETCH p.category ORDER BY p.productId DESC", Product.class);
			query.setMaxResults(10);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public List<Product> findAllPaged(int page, int pageSize) {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			TypedQuery<Product> query = em.createQuery(
					"SELECT p FROM Product p JOIN FETCH p.category ORDER BY p.productId DESC", Product.class);
			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			return query.getResultList();
		} finally {
			em.close();
		}
	}

	@Override
	public long count() {
		EntityManager em = JpaConfig.getEntityManager();
		try {
			return em.createQuery("SELECT COUNT(p) FROM Product p", Long.class).getSingleResult();
		} finally {
			em.close();
		}
	}
}