package com.niit.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.niit.model.Supplier;


@Repository
public class SupplierDAOImpl implements SupplierDAO {
	
	@Autowired
	private  SessionFactory  sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}

	
	public List<Supplier> getAllSupplier() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Supplier");
		List<Supplier> supplier = query.list();
		return supplier;
	}

	
	public Supplier getSupplierById(String id) {
		Session session = sessionFactory.getCurrentSession();
		Supplier supplier = (Supplier)session.get(Supplier.class ,id);
		return supplier;
	}

	
	public void addSupplier(Supplier supplier) {
		sessionFactory.getCurrentSession().saveOrUpdate(supplier);
		
	}

	
	public void deleteSupplier(String id) {
		Supplier supplier = new Supplier();
		supplier.setId(id);
		sessionFactory.getCurrentSession().delete(supplier);

		
	}




	

	

}
