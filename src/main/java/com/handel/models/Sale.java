package com.handel.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

@Entity
@Table(name = "sales", uniqueConstraints = { @UniqueConstraint(columnNames = { "id" }) })
public class Sale {

	@Id
	@Basic(optional = false)
	@Column(name = "id", nullable = false)
	private Integer id;
	private Date startDate;
	private Date endDate;
	private Integer status;
	private BigDecimal totalAmount;
	private BigDecimal discount;
	private BigDecimal received;
	private Integer paymentMethod;

	@OneToMany(cascade = CascadeType.PERSIST, targetEntity = Item.class, mappedBy = "sale")
	private List<Item> items;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public List<Item> getItems() {
		if (this.items == null)
			items = new ArrayList<>();
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	public BigDecimal getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(BigDecimal totalAmount) {
		this.totalAmount = totalAmount;
	}

	public BigDecimal getDiscount() {
		return discount;
	}

	public void setDiscount(BigDecimal discount) {
		this.discount = discount;
	}

	public BigDecimal getReceived() {
		return received;
	}

	public void setReceived(BigDecimal received) {
		this.received = received;
	}

	public Integer getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(Integer paymentMethod) {
		this.paymentMethod = paymentMethod;
	}
	
	public String getPaymentMethodClass() {
		return this.paymentMethod == PaymentMethod.CARD.id ? "fa fa-credit-card blue" :"fa fa-money dark-green";
	}

}
