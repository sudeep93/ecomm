package com.niit.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;



@Entity
@Table(name="product")
public class Product  implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -2563291142643330155L;
	@Id
@Column(name="isbn")
@GeneratedValue(strategy=GenerationType.AUTO)
private int isbn;
private String name;
@ManyToOne(cascade=CascadeType.ALL)
@JoinColumn(name="cid")
private Category category;
@Column(length=1000)
private String productdesc;



private String supplierId;



public String getSupplierId() {
	return supplierId;
}
public void setSupplierId(String supplierId) {
	this.supplierId = supplierId;
}
private String brand;
private double price;
@Transient
private MultipartFile productImage;
//getter and setter for bookImage


public MultipartFile getProductImage() {
	return productImage;
}
public void setProductImage(MultipartFile productImage) {
	this.productImage = productImage;
}
public int getIsbn() {
	return isbn;
}
public void setIsbn(int isbn) {
	this.isbn = isbn;
}


public Category getCategory() {
	return category;
}
public void setCategory(Category category) {
	this.category = category;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public String getProductdesc() {
	return productdesc;
}
public void setProductdesc(String productdesc) {
	this.productdesc = productdesc;
}
public String getBrand() {
	return brand;
}
public void setBrand(String brand) {
	this.brand = brand;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}

}
