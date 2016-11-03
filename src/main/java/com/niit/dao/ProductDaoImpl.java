package com.niit.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Product;
@Repository
public class ProductDaoImpl implements ProductDao{
	@Autowired
private SessionFactory sessionFactory;
	public SessionFactory getSessionFactory() {
	return sessionFactory;
}

public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}
	public List<Product> getAllProducts() {
		//it will open a new session always.
		Session session=sessionFactory.openSession();
		//Selecting all records from the table
		List<Product> products=session.createQuery("from Product").list();
		session.close();// close the session.
		
		return products;
		
	}
	public Product getProductByIsbn(int i) {
		//reading the record from the table
	  Session session=sessionFactory.openSession();
	  //select * from product where isbn=i
	  //if we call get method,Record doesnot exist it will return null
	  //if we call load, if the record doesnt exist it will throw exception
	  Product product=(Product)session.get(Product.class, i);  
	  session.close();
	  return product;
	}
	public void deleteProduct(int isbn) {
		Session session=sessionFactory.openSession();
		//select * from product where isbn=?
		Product product=(Product)session.get(Product.class, isbn);
		//delete from product where isbn=?
		session.delete(product);
		//commit the changes
		//changes to the database will become permanent
		session.flush();
		//closing the connection with the database.
		session.close();//close the session
		
		
	}
	
	public void addProduct(Product product) {
		Session session = sessionFactory.openSession();
		session.save(product);
		session.flush();
		session.close();
		
	}

	public void editProduct(Product product) {
		Session session=sessionFactory.openSession();
		//update bookapp set ....where isbn=?
		session.update(product);
		session.flush();
		session.close();

		
	}

		
	}


