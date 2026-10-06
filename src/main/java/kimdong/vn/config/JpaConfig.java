package kimdong.vn.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaConfig {
	private static final EntityManagerFactory factory = Persistence.createEntityManagerFactory("WebAppJPA");

	public static EntityManager getEntityManager() {
		return factory.createEntityManager();
	}
}