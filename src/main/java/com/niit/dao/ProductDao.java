package com.niit.dao;

import java.util.List;

import com.niit.model.Product;

public interface ProductDao {
public void addProduct(Product product);	
List<Product> getAllProducts();
Product getProductByIsbn(int isbn);
void deleteProduct(int isbn);
void editProduct(Product product);
}
