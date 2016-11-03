package com.niit.services;

import java.util.List;
import com.niit.model.Product;
public interface ProductService {
	public void addProduct(Product product);
List<Product> getAllProducts();
Product getProductByIsbn(int isbn);
void deleteProduct(int isbn);
public void editProduct(Product product);
}
