package com.niit.dao;


import java.util.List;

import com.niit.model.Supplier;

public interface SupplierDAO {

	
public List<Supplier> getAllSupplier();
	
	public Supplier getSupplierById(String id);
	
	public void addSupplier(Supplier supplier);
	
	public void deleteSupplier(String id);
}
