package com.handel.controllers;

import java.math.BigDecimal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.handel.daos.ProductsDao;
import com.handel.daos.SaleDao;
import com.handel.models.Item;
import com.handel.models.ItemStatus;
import com.handel.models.Product;
import com.handel.models.Sale;
import com.handel.models.SaleStatus;
import com.handel.printer.ReceiptHelper;

@Controller
public class SalesController {

	@Autowired
	private SaleDao saleDao;

	@Autowired
	private ProductsDao productsDao;

	@Autowired
	private ReceiptHelper receiptHelper;

	@RequestMapping(value = "/addItemToSale", method = RequestMethod.GET)
	@ResponseBody
	public String addItemToSale(@RequestParam Integer ticketNumber, @RequestParam String productCode,
			@RequestParam Integer quantity) {

		Product product = productsDao.find(productCode);

		Sale sale = saleDao.find(ticketNumber);
		if (sale.getId() == null) {
			sale.setId(ticketNumber);
			sale.setStartDate(new Date());
			sale.setStatus(SaleStatus.OPEN.id);
		}

		Item item = new Item();
		item.setNumber(sale.getItems().size() + 1);
		item.setProduct(product);
		item.setQuantity(quantity);
		item.setStatus(ItemStatus.CONFIRMED.id);
		item.setUnitPrice(product.getPrice());
		item.setSale(sale);

		sale.getItems().add(item);

		saleDao.save(sale);

		return calculateSubTotal(sale).toString();

	}

	private BigDecimal calculateSubTotal(Sale sale) {
		BigDecimal subTotal = BigDecimal.ZERO;

		for (Item item : sale.getItems()) {
			subTotal = subTotal.add(item.getUnitPrice().multiply(new BigDecimal(item.getQuantity())));
		}
		return subTotal;
	}

	@RequestMapping(value = "/finish", method = RequestMethod.GET)
	public ResponseEntity<?> finish(@RequestParam Integer ticketNumber, @RequestParam Integer paymentOptionId,
			@RequestParam BigDecimal totalAmount, @RequestParam BigDecimal discount,
			@RequestParam BigDecimal receivedAmount) {
		Sale sale = saleDao.find(ticketNumber);
		sale.setStatus(SaleStatus.COMPLETED.id);
		sale.setEndDate(new Date());
		sale.setPaymentMethod(paymentOptionId);
		sale.setTotalAmount(totalAmount);
		sale.setDiscount(discount);
		sale.setReceived(receivedAmount);

		dischargeProducts(sale);
		saleDao.save(sale);
		receiptHelper.printReceipt(sale);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	private void dischargeProducts(Sale sale) {
		for (Item item : sale.getItems()) {
			item.getProduct().setQuantity(item.getProduct().getQuantity() - item.getQuantity());
		}
	}

}
