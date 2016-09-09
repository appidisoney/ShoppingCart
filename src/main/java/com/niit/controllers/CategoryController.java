package com.niit.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.niit.DAO.CategoryDAO;
import com.niit.model.Category;


@Controller
public class CategoryController {
	
	@Autowired
	CategoryDAO categoryDAO;
	/*@Autowired
	Category category;*/
	
	@RequestMapping(value={"editcategory","addeditcategory/{id}/editcategory"})
    public String addcategory(@ModelAttribute("category")Category category, Model m)
    {
		categoryDAO.saveOrUpdate(category);
    	return "redirect:/Category";
    }
	
	 /*@RequestMapping(value="delcategory")
	   public String deletecategory(@ModelAttribute("category")Category category, Model m)
	   {
	    	categoryDAO.delete(category);
	    m.addAttribute("del","category deleted successfully");
	    return "Home";
	   }*/

    @RequestMapping(value="Category")
   public ModelAndView categorypage(@ModelAttribute("category") Category category,BindingResult result,
   		@ModelAttribute("category1") Category category1,BindingResult result1)
   {
    	
   	 ModelAndView mv= new ModelAndView("/Home");
   	//mv.addObject("category", new Category());
   	mv.addObject("categoryList",categoryDAO.list());
   	mv.addObject("UserClickedcategory", "true");
   	return mv;
   }
    
    @RequestMapping(value={"addeditcategory/{id}"})
    public String Categorypagedelete(@PathVariable("id") String id,RedirectAttributes attributes){
   	 attributes.addFlashAttribute("category1",this.categoryDAO.get(id));
   	 return "redirect:/Category";
    }
    @RequestMapping(value={"adddeletecategory/{id}"})
    public String Categorypageedit(@ModelAttribute("category") Category category,Model m){
    	categoryDAO.delete(category);
   	 return "redirect:/Category";
    }
	
		
}

