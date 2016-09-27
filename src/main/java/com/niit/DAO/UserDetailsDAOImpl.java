package com.niit.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.model.UserDetails;

@Repository(value="userDetailsDAO")
@SuppressWarnings("deprecation")
public class UserDetailsDAOImpl implements UserDetailsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public UserDetailsDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory=sessionFactory;
	}
	@Transactional
	public boolean saveOrUpdate(UserDetails userDetails){
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(userDetails);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	@Transactional
	public boolean delete(UserDetails userDetails){
		try {
			sessionFactory.getCurrentSession().delete(userDetails);
			return true;
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
	}
	@Transactional
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public  UserDetails get1(int id){
		
		String hql = "from UserDetails where id= "+ "'"+ id+"'" ;
		Query query=sessionFactory.getCurrentSession().createQuery(hql);
		List<UserDetails>list= query.list();
		
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
	public UserDetails isValidUser(int id, String password)
	{
		//select *from UserDetails where id='101' and password 'niit'
	String hql = "from UserDetails where id = '"+id+"' and password= '" +password +"'";
	
	@SuppressWarnings("rawtypes")
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	@SuppressWarnings("unchecked")
	List<UserDetails> list = query.list();
	if(list==null)
	{
		return null;
	}
	else
	{
		return list.get(0);
	}
}	
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public  List<UserDetails> list(){
		
		String hql ="from UserDetails";
	Query query = sessionFactory.getCurrentSession().createQuery(hql);
	return query.list();
	}
	public UserDetails isVaidUser(int id, String password) {
		// TODO Auto-generated method stub
		return null;
	}
	public UserDetails get(int id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Transactional
	@SuppressWarnings("unchecked")
	public UserDetails get(String username) {
		Criteria c= sessionFactory.getCurrentSession().createCriteria(UserDetails.class);
		c.add(Restrictions.eq("username",username));
		List<UserDetails> listuser = c.list();
		if(listuser!=null&&!listuser.isEmpty()){
			return listuser.get(0);
		}else{
			return null;
		}
		
		
	}
	
		
	
}
