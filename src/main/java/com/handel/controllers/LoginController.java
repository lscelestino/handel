package com.handel.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.handel.daos.UserDAO;
import com.handel.models.User;

/**
 * Created by djlima on 5/23/17.
 * <p>
 * 
 */
@Controller
public class LoginController {
	
	@Autowired
	private UserDAO userDAO;

	/**
	 * Returns login page. Every unauthenticated user will be redirect to this page
	 *
	 * @return login view
	 */
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String loginForm() {
		return "loginForm";
	}
	
	/**
	 * Returns form view to register a new user
	 *
	 * @param user object
	 * @return user form view
	 */
	@RequestMapping(value="/register/user", method=RequestMethod.POST)
	public ModelAndView save(@Valid User user, BindingResult result, RedirectAttributes redirectAttributes, HttpServletRequest request) {	
		//if(result.hasErrors()) {
			//return create(blogPost);
		//}
		userDAO.registerNewUserAccount(user);
		
		redirectAttributes.addFlashAttribute("success", "Usuário registrado com sucesso!");
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(user.getUsername(), user.getPassword()));
		
		return new ModelAndView("redirect:/videos");
	}
}
