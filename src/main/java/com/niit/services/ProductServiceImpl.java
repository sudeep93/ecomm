package com.niit.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.niit.dao.ProductDao;
import com.niit.model.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
private ProductDao productDao;

	public ProductDao getProductDao() {
	return productDao;
}

public void setProductDao(ProductDao productDao) {
	this.productDao = productDao;
}
  @Transactional
	public List<Product> getAllProducts() {
		return productDao.getAllProducts();
	}
public Product getProductByIsbn(int isbn) {
	return productDao.getProductByIsbn(isbn);
}
public void deleteProduct(int isbn) {
	 productDao.deleteProduct(isbn);
	
}

@Transactional
public void addProduct(Product product) {
	this.productDao.addProduct(product);
}

public void editProduct(Product product) {
	this.productDao.editProduct(product);
	
}



}


