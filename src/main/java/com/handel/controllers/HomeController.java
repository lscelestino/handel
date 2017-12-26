package com.handel.controllers;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.handel.daos.ProductsDao;
import com.handel.daos.SaleDao;
import com.handel.models.Product;
import com.handel.models.Sale;
import com.handel.models.User;

@Controller
public class HomeController {
	
	@Autowired
	private ProductsDao productsDao;
	
	@Autowired
	private SaleDao saleDao;

	/**
	 * Redirects to products list
	 *
	 * @param principal authenticated user
	 * @param request   http request
	 * @param session   http session
	 * @return if admin redirects to products list management, if user return products list
	 */
	@RequestMapping("/")
	public ModelAndView index(Principal principal, HttpServletRequest request, HttpSession session, User user) {
		if (request.isUserInRole("ADMIN")) {
            return new ModelAndView("redirect:/blogAdmin");
        }
		
		ModelAndView modelAndView = new ModelAndView("index");
		
		return modelAndView;
	}
	
	
	@RequestMapping("/products")
	public ModelAndView products() {
		ModelAndView modelAndView = new ModelAndView("products");
		List<Product> products = productsDao.listProducts();
		modelAndView.addObject("products", products);
		return modelAndView;
	}

	@RequestMapping("/sales")
	public ModelAndView sales() {
		ModelAndView modelAndView = new ModelAndView("sales");
		List<Sale> sales = saleDao.listSales();
		modelAndView.addObject("sales", sales);
		return modelAndView;
	}
	
	@RequestMapping("/charts")
	public ModelAndView charts() {
		ModelAndView modelAndView = new ModelAndView("charts");
		List<Integer> dailySales = saleDao.listDailySalesByMonth();
		modelAndView.addObject("dailySales", dailySales);
		modelAndView.addObject("dailySalesIncome", saleDao.listDailySalesIncomeByMonth());
		modelAndView.addObject("cash", saleDao.listDailySalesWithCashByMonth());
		modelAndView.addObject("card", saleDao.listDailySalesWithCardByMonth());
		
		modelAndView.addObject("days", generateDays(dailySales.size()));
		return modelAndView;
	}
	
	@RequestMapping("/pos")
	public ModelAndView pos() {
		Date now = new Date();
		ModelAndView modelAndView = new ModelAndView("pos");
		modelAndView.addObject("ticketNumber", String.format("%04d", saleDao.retrieveNextTicketNumber()));
		modelAndView.addObject("date", new SimpleDateFormat("dd/MM/yyyy").format(now));
		modelAndView.addObject("time", new SimpleDateFormat("HH:mm").format(now));
		List<Product> products = productsDao.listProducts();
		modelAndView.addObject("products", products);
		return modelAndView;
	}
	
	
//	@RequestMapping("/teste")
//	public ModelAndView teste() {
//		ModelAndView modelAndView = new ModelAndView("dataTable");
//		List<Product> products = productsDao.listProducts();
//		modelAndView.addObject("products", products);
//		return modelAndView;
//	}
//	
//	@RequestMapping(value = "/retrieveProducts", method = RequestMethod.GET, produces = "application/json")
//	public List<Product> retrieveProducts() {
//		return productsDao.listProducts();
//	}
//	
	
	/**
	 * Default error handler
	 *
	 * @return error view
	 */
	@ExceptionHandler(value = Exception.class)
	public ModelAndView defaultErrorHandler(User user) {
		return new ModelAndView("error");
	}
	
	private List<Integer> generateDays(Integer lastDay) {
		List<Integer> days = new ArrayList<>();
		for (int c = 1; c <= lastDay; c++) {
			days.add(c);
		}
		return days;
	}
}
