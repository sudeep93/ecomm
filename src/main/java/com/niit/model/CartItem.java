package com.niit.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="cartitem")
public class CartItem implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1015635852046617227L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int cartItemId;
	
private int quantity;

private double totalPrice;

@ManyToOne
@JoinColumn(name="isbn")
private Product product;


public Product getProduct() {
	return product;
}
public void setProduct(Product product) {
	this.product = product;
}
@ManyToOne
@JoinColumn(name="cartId")
@JsonIgnore
private Cart cart;



public int getCartItemId() {
	return cartItemId;
}
public void setCartItemId(int cartItemId) {
	this.cartItemId = cartItemId;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public double getTotalPrice() {
	return totalPrice;
}
public void setTotalPrice(double totalPrice) {
	this.totalPrice = totalPrice;
}

public Cart getCart() {
	return cart;
}
public void setCart(Cart cart) {
	this.cart = cart;
}

}
