package com.niit.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.model.Product;



@Repository
public interface ProductDAO {
	
	public boolean saveOrUpdate(Product product);
	
	public boolean delete(Product product);
	
	public Product get(String id);
	
	public List<Product> list();

	
	

}
