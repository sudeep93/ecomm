package com.niit.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="productcategories")
public class Category implements Serializable  { // Category has list of products
/**
	 * 
	 */
	private static final long serialVersionUID = -7837337820556131204L;
@Id
private int cid;
@Column(name="category")
private String categoryName;
@OneToMany(mappedBy="category",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
@JsonIgnore
List<Product> products;
public int getCid() {
	return cid;
}
public void setCid(int cid) {
	this.cid = cid;
}
public String getCategoryName() {
	return categoryName;
}
public void setCategoryName(String categoryName) {
	this.categoryName = categoryName;
}
public List<Product> getProducts() {
	return products;
}
public void setProducts(List<Product> products) {
	this.products = products;
}

}
