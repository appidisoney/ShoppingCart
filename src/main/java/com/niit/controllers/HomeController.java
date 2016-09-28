package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;

@Controller
public class HomeController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	
	@RequestMapping( value={"/","Home"})
	public String homepage (Model mv){             // navigate without carrying data
		
		mv.addAttribute("CategoryList", categoryDAO.list());
		mv.addAttribute("productList", productDAO.list());
		return "Home";
	}
	
	@RequestMapping(value ="ShowProduct/{id}" )
	public String ShowProduct(@PathVariable("id") int id,RedirectAttributes attributes,Model m) {
	m.addAttribute("Clickedshowproduct", "true");
		m.addAttribute("IndividualProduct", productDAO.getproduct(id));
		return "ShowProduct";
	}

		/*@RequestMapping("/Login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("Login");
		mv.addObject("UserClickedlogin", "True");
		return mv;
	}*/
}