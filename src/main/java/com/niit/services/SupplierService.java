package com.niit.services;

import java.util.List;
import java.util.Map;

import com.niit.model.Supplier;

public interface SupplierService {
	
public List<Supplier> getAllSupplier();
	
	public Supplier getSupplierById(String id);
	
	public void addSupplier(Supplier supplier);
	
	public void deleteSupplier(String id);

	public Map<String, String> getSuppliers();
}
