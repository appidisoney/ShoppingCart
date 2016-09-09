package com.niit.shoppingcartbackend;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.niit.DAO.CategoryDAO;
import com.niit.model.Category;

public class CategoryTest {
	
	
	public static void main(String[] args) {
	      
	
		AnnotationConfigApplicationContext context = new AnnotationConfigApplicationContext();
		context.scan("com.niit");
		context.refresh();
		
		CategoryDAO categoryDAO =   (CategoryDAO) context.getBean("categoryDAO");
		Category category =   (Category) context.getBean("category");
		
		category.setId("CN01");
		category.setName("mobile");
		category.setDescription("this is sony mobile");
		categoryDAO.saveOrUpdate(category);
		categoryDAO.delete(category);
		
		System.out.println("save");
		context.close();
		if (categoryDAO.saveOrUpdate(category)== true)
		{
		System.out.println("Categroy created successfully");
		}
		else
		{
			System.out.println("category created unsuccessfully");
			
		}
		
		
	}
	
}



