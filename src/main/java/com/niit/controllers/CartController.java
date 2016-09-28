package com.niit.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.DAO.CartDAO;
import com.niit.DAO.ProductDAO;
import com.niit.model.Cart;
import com.niit.model.Product;

@Controller
public class CartController {
	@Autowired
	CartDAO cartDAO;
	@Autowired
	ProductDAO productDAO;

	@RequestMapping(value = "addtocart/{id}")
	public String addproduct(@PathVariable("id") int id, @ModelAttribute("cart") Cart cart,
			RedirectAttributes attributes, HttpSession session) {
		int q = 1;

		if (cartDAO.getproduct(id) == null) {
			Product product = productDAO.get(id);
			Cart cart1 = new Cart();
			int c = product.getId();
			System.out.println(c);
			cart1.setProductid(c);
			cart1.setProductname(product.getName());
			cart1.setPrice(product.getPrice());
			/* cart1.setPrice(product.getPrice() + (q*p.getPrice())); */
			cart1.setUserid((Integer) session.getAttribute("id"));
			cart1.setStatus("C");
			System.out.println(q);
			cart1.setQuantity(q);
			cartDAO.save(cart1);

		} else {
			System.out.println(q);

			cart.setUserid((Integer) session.getAttribute("id"));
			cart.setStatus("C"); // List<Cart> carta= cartDAO.getproduct(id);
			// cart.setId( cart.getId());
			q += 1;
			cart.setQuantity(q);
			cartDAO.update(cart);
		}

		return "redirect:/";

	}

	@RequestMapping(value = "delete/{id}")
	public String delete(@ModelAttribute("cart") Cart cart) {
		cartDAO.delete(cart);
		return "redirect:/Cart";
	}

	@RequestMapping(value = "Cart")
	public ModelAndView cartpage(@ModelAttribute("cart") Cart cart, HttpSession session) {
		ModelAndView mv = new ModelAndView("/Cart");
		if (cartDAO.list().isEmpty()) {
			mv.addObject("emptycart", "Sorry your shopping cart is empty");
		} else {
			mv.addObject("cartList", cartDAO.list());
			mv.addObject("cartprice", cartDAO.CartPrice((Integer) session.getAttribute("id")));
		}
		mv.addObject("UserClickedCart", "true");
		return mv;
	}

}