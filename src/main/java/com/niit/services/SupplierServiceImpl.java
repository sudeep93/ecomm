package com.niit.services;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.SupplierDAO;
import com.niit.model.Supplier;


@Service
public class SupplierServiceImpl implements SupplierService{
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	public void setSupplierDAO(SupplierDAO supplierDAO){
		this.supplierDAO = supplierDAO;
	}

	
	@Transactional
	public List<Supplier> getAllSupplier() {
		
		return this.supplierDAO.getAllSupplier();
	}


	@Transactional
	public Supplier getSupplierById(String id) {
		return this.supplierDAO.getSupplierById(id);
	}

	
	@Transactional
	public void addSupplier(Supplier supplier) {
		this.supplierDAO.addSupplier(supplier);
		
	}

	

	
	@Transactional
	public void deleteSupplier(String id) {
		this.supplierDAO.deleteSupplier(id);
		
	}
	
	
	
	@Transactional
	public Map<String, String> getSuppliers() {
		List<Supplier> supplierList = this.supplierDAO.getAllSupplier();
		Map<String, String> suppliers = new LinkedHashMap<String, String>();
		
		for (Supplier supplier : supplierList) {
			suppliers.put(supplier.getId(), supplier.getName());
		}
		
		return suppliers;
	}

	
}
