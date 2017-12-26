package com.handel.controllers;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.handel.daos.ProductsDao;
import com.handel.editors.BigDecimalCustomEditor;
import com.handel.infra.FileSaver;
import com.handel.models.Product;
import com.handel.utils.HandelUtils;

@Controller
public class ProductsController {

	@Autowired
	private ProductsDao productsDao;

	@Autowired
	private HandelUtils handelUtils;

	@Autowired
	private FileSaver fileSaver;

	@InitBinder
	public void dataBinding(WebDataBinder binder, WebRequest request) {
		binder.registerCustomEditor(BigDecimal.class, new BigDecimalCustomEditor(BigDecimal.class, false));
	}

	@RequestMapping("/addProduct")
	public ModelAndView addProducts() {
		ModelAndView modelAndView = new ModelAndView("addProduct");
		Product newProduct = new Product();
		newProduct.setCode(handelUtils.generateProductCode());
		modelAndView.addObject("product", newProduct);
		return modelAndView;
	}

	@RequestMapping("/editProduct")
	public ModelAndView editProduct(@RequestParam String code) {
		ModelAndView modelAndView = new ModelAndView("addProduct");
		modelAndView.addObject("product", productsDao.find(code));
		modelAndView.addObject("editMode", true);
		return modelAndView;
	}

	@RequestMapping(value = "/saveProduct", method = RequestMethod.POST)
	public ModelAndView submit(MultipartFile image, @Valid @ModelAttribute("product") Product product,
			BindingResult result, ModelMap model) {
		boolean isEditMode = product.getId() != null;

		if (!StringUtils.isEmpty(image.getOriginalFilename())) {
			String path = fileSaver.write("imagem-produtos", image);
			product.setImagePath(path);
		}

		productsDao.save(product);

		ModelAndView modelAndView;

		if (isEditMode) {
			modelAndView = new ModelAndView("products");
			List<Product> products = productsDao.listProducts();
			modelAndView.addObject("products", products);
		} else {
			modelAndView = new ModelAndView("addProduct");
			modelAndView.addObject("productSaved", true);
		}

		return modelAndView;
	}

	@RequestMapping(value = "/searchProduct", method = RequestMethod.GET, produces = "application/json")
	public Product searchProduct(@RequestParam String code) {
		return productsDao.find(code);
	}

}
