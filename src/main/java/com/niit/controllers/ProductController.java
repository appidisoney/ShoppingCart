package com.niit.controllers;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.DAO.CategoryDAO;
import com.niit.DAO.ProductDAO;
import com.niit.DAO.SupplierDAO;
import com.niit.model.Product;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO productDAO;
	@Autowired
	CategoryDAO categoryDAO;
	@Autowired
	SupplierDAO supplierDAO;
	private Path path;
	
	
	@RequestMapping(value={"editproduct","addeditproduct/{id}/editproduct"})
    public String addproduct(@ModelAttribute("product")Product product, HttpServletRequest request,Model m)
    {
		productDAO.saveOrUpdate(product);
		MultipartFile file=product.getImage();
		String rootDirectory = request.getSession().getServletContext().getRealPath("/");
		path = Paths.get(rootDirectory +"\\resources\\images\\"+product.getId()+".jpg");
		if (file !=null && !file.isEmpty()) {
			try{
				System.out.println("image saving start");
				file.transferTo(new File(path.toString()));
				System.out.println("image saved");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("error");
				throw new RuntimeException("item image saving failed",e);
			}
		}
    	return "redirect:/Product";
 }

 @RequestMapping(value="Product")
public ModelAndView productpage(@ModelAttribute("product") Product product,BindingResult result,
		@ModelAttribute("product1") Product product1,BindingResult result1)
{
 	
	 ModelAndView mv= new ModelAndView("/Home");
	//mv.addObject("product", new Product());
	mv.addObject("productList",productDAO.list());
	mv.addObject("categoryList",categoryDAO.list());
	mv.addObject("supplierList",supplierDAO.list());
	mv.addObject("UserClickedproduct", "true");
	return mv;
}
 @RequestMapping(value={"addeditproduct/{id}"})
 public String Productpagedelete(@PathVariable("id") String id,RedirectAttributes attributes){
	 attributes.addFlashAttribute("product1",this.productDAO.get(id));
	 return "redirect:/Product";
 }
 @RequestMapping(value={"adddeleteproduct/{id}"})
 public String Productpageedit(@ModelAttribute("product") Product product,Model m){
 	productDAO.delete(product);
	 return "redirect:/Product";
 }
}

	
	