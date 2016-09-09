package com.niit.config;

import java.util.Properties;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.niit.DAO.CartDAO;
import com.niit.DAO.CartDAOImpl;
import com.niit.DAO.CategoryDAO;
import com.niit.DAO.CategoryDAOImpl;
import com.niit.DAO.SupplierDAO;
import com.niit.DAO.SupplierDAOImpl;
import com.niit.model.Cart;
import com.niit.model.Category;
import com.niit.model.Product;
import com.niit.model.Supplier;
import com.niit.model.UserDetails;

@Configuration
@ComponentScan("com.niit")
@EnableTransactionManagement
public class ApplicationContextConfig {
	
	
	@Bean(name="dataSource")
	public DataSource getDataSource(){
		DriverManagerDataSource dataSource =new DriverManagerDataSource();
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/niitdb");
		dataSource.setUsername("sa");
		dataSource.setPassword("sa");
		return dataSource;
	}
		
		

	private Properties getHibernateProperties() {
		 Properties properties=new Properties();
		 properties.put("hibernate.show_sql", "true");
		 properties.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		 properties.put("hibernate.hbm2ddl.auto", "update");
		 return properties;
}
	
	@Autowired
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder= new LocalSessionFactoryBuilder(dataSource);
		sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(Category.class);
		sessionBuilder.addAnnotatedClass(Product.class);
		sessionBuilder.addAnnotatedClass(Supplier.class);
		sessionBuilder.addAnnotatedClass(UserDetails.class);
		sessionBuilder.addAnnotatedClass(Cart.class);
		return sessionBuilder.buildSessionFactory();
}

	
@Autowired
@Bean(name="transactionManager")
public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
	 HibernateTransactionManager transactionManager= new HibernateTransactionManager(sessionFactory);	
	 return transactionManager;
	
}

@Autowired
@Bean(name="categoryDAO")
public CategoryDAO getCategoryDAO(SessionFactory sessionFactory) {
	return new CategoryDAOImpl(sessionFactory);
}

@Autowired
@Bean(name="supplierDAO")
public SupplierDAO getSupplierDAO(SessionFactory sessionFactory) {
	return new SupplierDAOImpl(sessionFactory);
}

@Autowired
@Bean(name="CartDAO")
public CartDAO getCartDAO(SessionFactory sessionFactory) {
	return new CartDAOImpl(sessionFactory);
}



}


	

