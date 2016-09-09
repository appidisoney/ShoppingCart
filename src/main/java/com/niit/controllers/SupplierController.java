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

import com.niit.model.Supplier;
import com.niit.DAO.SupplierDAO;

@Controller
public class SupplierController {
	
    @Autowired
	SupplierDAO supplierDAO;
       
    @RequestMapping(value={"editsupplier","addeditsupplier/{id}/editsupplier"})
    public String addsupplier(@ModelAttribute("supplier")Supplier supplier, Model m)
    {
    	supplierDAO.saveOrUpdate(supplier);
    	return "redirect:/Supplier";
    }
    
     @RequestMapping(value="Supplier")
    public ModelAndView supplier(@ModelAttribute("supplier") Supplier supplier,BindingResult result,
    		@ModelAttribute("supplier1") Supplier supplier1,BindingResult result1)
    {
    	 ModelAndView mv= new ModelAndView("/Home");
    	//mv.addObject("supplier", new Supplier());
    	mv.addObject("supplierList",supplierDAO.list());
    	mv.addObject("UserClickedsupplier", "true");
    	return mv;
    }
     @RequestMapping(value={"addeditsupplier/{id}"})
     public String Supplierpagedelete(@PathVariable("id") String id,RedirectAttributes attributes){
    	 attributes.addFlashAttribute("supplier1",this.supplierDAO.get(id));
    	 return "redirect:/Supplier";
     }
     @RequestMapping(value={"adddeletesupplier/{id}"})
     public String Supplierpageedit(@ModelAttribute("supplier") Supplier supplier,Model m){
    	 supplierDAO.delete(supplier);
    	 return "redirect:/Supplier";
     }
}
