package com.niit.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.niit.model.Cart;

@Repository
public interface CartDAO {
public boolean save(Cart cart);
public boolean update(Cart cart);
public boolean delete(Cart cart);
public List<Cart>list();
public Cart get(int id);
public Cart getproduct(int id);
public void pay(int userId);

public long CartPrice(int userId);

public long cartsize(int userId);
}