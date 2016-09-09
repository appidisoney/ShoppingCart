package com.niit.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	/*@RequestMapping("/")

	public String home() {                     // navigate without carrying data
		return "/Home";
	}*/

	@RequestMapping
	public ModelAndView Home() {              // navigate without carrying data
		ModelAndView mv = new ModelAndView("Home");
		mv.addObject("message", "Thankyou for visiting this URL");
		return mv;
	}

	@RequestMapping("/Registration")
	public ModelAndView registration() {
		ModelAndView mv = new ModelAndView("Registration");
		mv.addObject("UserClickedRegistrationHere", "True");
		return mv;
	}

	@RequestMapping("/Login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView("Login");
		mv.addObject("UserClickedLoginHere", "True");
		return mv;
	}
}