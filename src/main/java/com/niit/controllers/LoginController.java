package com.niit.controllers;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.DAO.UserDetailsDAO;
import com.niit.model.UserDetails;

@Controller
public class LoginController {
@Autowired
CategoryDAO categoryDAO;
@Autowired
ProductDAO productDAO;
@Autowired
UserDetailsDAO userDetailsDAO;

@RequestMapping(value = "Login")
public String DisplayLogin(Model mv) {
	mv.addAttribute("userDetails", new UserDetails());
	mv.addAttribute("UserClickedlogin", "true");
	mv.addAttribute("HideOthers","true");

	return "Home";
}

@RequestMapping(value = "adduser", method = RequestMethod.POST)
public String UserRegister(@ModelAttribute("userDetails") UserDetails userDetails, Model mv) {
	userDetails.setEnabled(true);
	userDetails.setRole("ROLE_USER");
	userDetailsDAO.saveOrUpdate(userDetails);
	mv.addAttribute("registered", "Registration Success");
	return "redirect:/Login";
}

@SuppressWarnings("unchecked")
@RequestMapping(value = "/login_session_attributes")
public String login_session_attributes(HttpSession session) {
	String username = SecurityContextHolder.getContext().getAuthentication().getName();
	UserDetails user = userDetailsDAO.get(username);
	session.setAttribute("id", user.getId());
	session.setAttribute("username", user.getUsername());
	session.setAttribute("LoggedIn", "true");

	Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) SecurityContextHolder.getContext()
	.getAuthentication().getAuthorities();
	String role="ROLE_USER";
	for (GrantedAuthority authority : authorities) 
	{
	  
	     if (authority.getAuthority().equals(role)) 
	     {
	    	 session.setAttribute("UserLoggedIn", "true");
	    	 return"/Home";
	     }
	     else 
	     {
	    	 session.setAttribute("Administrator", "true");
	    	 return"/Admin";
		 }
	}
	return "Login";
}

}
