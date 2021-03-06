package com.niit.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.model.Supplier;


@Repository
public interface SupplierDAO {

	public boolean saveOrUpdate(Supplier supplier);
	
	public boolean delete( Supplier supplier);
	
	public Supplier get(String id);
	
	public List<Supplier> list();

	
	
	
}
