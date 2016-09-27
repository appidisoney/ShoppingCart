package com.niit.DAO;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.niit.model.Product;

@Repository(value="productDAO")
@SuppressWarnings("deprecation")
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public ProductDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public boolean saveOrUpdate(Product product){
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(product);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(Product product){
		try {
			sessionFactory.getCurrentSession().delete(product);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	@Transactional
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public  Product get(int id){
		
		String hql = "from Product where id= "+ "'"+ id+"'" ;
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		List<Product>list= query.list();
		
		if(list==null)
		{
			return null;
		}
		else
		{
			return list.get(0);
		}
	}
	@Transactional
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public  List<Product> list(){
		
		String hql ="from Product";
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	return query.list();
	}
	public Object getproduct(int id) {
		// TODO Auto-generated method stub
		return null;
	}

		@Transactional
		public List<Product> getcatitem(int id) {
			String hql = "from"+" Product"+" where categoryid=" +id;
			@SuppressWarnings("rawtypes")
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			
			@SuppressWarnings("unchecked")
			List<Product> listProduct = (List<Product>) query.list();
			if (listProduct != null && !listProduct.isEmpty()) {
				return listProduct;
			}
			return listProduct;
		}
	
	}

	

