package com.handel.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.handel.models.Product;

@Repository
@Transactional
public class ProductsDao {

	@PersistenceContext
	private EntityManager manager;

	public List<Product> listProducts() {
		return manager.createQuery("select p from Product p order by p.id", Product.class).getResultList();
	}

	public void save(Product product) {
		if (product.getId() == null) {
			manager.persist(product);
		} else {
			manager.merge(product);
		}
	}

	public Product find(String code) {
		List<Product> products = manager.createQuery("select p from Product p where p.code = :code", Product.class)
				.setParameter("code", code).getResultList();
		return products.size() > 0 ? products.get(0) : null;
	}

}
