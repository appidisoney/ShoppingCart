package com.niit.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.model.UserDetails;

@Repository
public interface UserDetailsDAO {

	public boolean saveOrUpdate(UserDetails userDetails);
	
	public boolean delete(UserDetails userDetails);
	
	public  UserDetails get(int id);
	
	public  UserDetails get(String password);
	
	public List<UserDetails> list();
	
	public UserDetails isValidUser(String id, String password);
}
