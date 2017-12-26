package com.handel.daos;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.handel.models.Sale;

@Repository
@Transactional
public class SaleDao {

	@PersistenceContext
	private EntityManager manager;

	public Integer retrieveNextTicketNumber() {
		return manager.createQuery("select COALESCE(max(id), 0) + 1 from Sale", Integer.class).getSingleResult();
	}

	public void save(Sale sale) {
		manager.persist(sale);
	}

	public Sale find(Integer ticketNumber) {
		List<Sale> sales = manager.createQuery("select s from Sale s where s.id = :ticketNumber", Sale.class)
				.setParameter("ticketNumber", ticketNumber).getResultList();
		return sales.size() > 0 ? sales.get(0) : new Sale();
	}

	public List<Sale> listSales() {
		return manager.createQuery("select s from Sale s order by s.id desc", Sale.class).getResultList();
	}

	public List<Integer> listDailySalesByMonth() {
		return manager
				.createNativeQuery(
						" select count(s.id) from handel.days d left join handel.sales s on d.id = day(s.startDate) where d.id <= day(curdate())  group by d.id order by d.id; ")
				.getResultList();
	}
	
	public List<BigDecimal> listDailySalesIncomeByMonth() {
		return manager
				.createNativeQuery(
						" select truncate(coalesce(sum(s.totalAmount),0),2) from handel.days d left join handel.sales s on d.id = day(s.startDate) where d.id <= day(curdate())  group by d.id order by d.id; ")
				.getResultList();
	}
	
	public List<BigDecimal> listDailySalesWithCardByMonth() {
		return manager
				.createNativeQuery(
						" select count(s.paymentMethod) from handel.days d left join handel.sales s on d.id = day(s.startDate) and s.paymentMethod = 2 where d.id <= day(curdate()) group by d.id, s.paymentMethod order by d.id; ")
				.getResultList();
	}
	
	public List<BigDecimal> listDailySalesWithCashByMonth() {
		return manager
				.createNativeQuery(
						" select count(s.paymentMethod) from handel.days d left join handel.sales s on d.id = day(s.startDate) and s.paymentMethod = 1 where d.id <= day(curdate()) group by d.id, s.paymentMethod order by d.id; ")
				.getResultList();
	}

}
