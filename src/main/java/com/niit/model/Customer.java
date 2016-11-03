package com.niit.model;
import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
@Entity
@Table(name="customer")
public class Customer implements Serializable  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 8659562452456449329L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int customerId;
private String customerName;
@NotEmpty(message="email already exists")
private String customerEmail;
private String customerPhone;

@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER )
@JoinColumn(name="usersid")
private Users users;

@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER )
@JoinColumn(name="billingaddressid")
private BillingAddress billingAddress;


@OneToOne(cascade=CascadeType.ALL,fetch=FetchType.EAGER )
@JoinColumn(name="cartid")
@JsonIgnore
 private Cart cart;
public Cart getCart() {
		return cart;
       }
       public void setCart(Cart cart) {
	               this.cart = cart;
}


@OneToOne(cascade = CascadeType.ALL,fetch=FetchType.EAGER )
@JoinColumn(name="shippingaddressid")
private ShippingAddress shippingAddress;
public int getCustomerId() {
	return customerId;
}
public void setCustomerId(int customerId) {
	this.customerId = customerId;
}
public String getCustomerName() {
	return customerName;
}
public void setCustomerName(String customerName) {
	this.customerName = customerName;
}
public String getCustomerEmail() {
	return customerEmail;
}
public void setCustomerEmail(String customerEmail) {
	this.customerEmail = customerEmail;
}
public String getCustomerPhone() {
	return customerPhone;
}
public void setCustomerPhone(String customerPhone) {
	this.customerPhone = customerPhone;
}
public Users getUsers() {
	return users;
}
public void setUsers(Users users) {
	this.users = users;
}
public BillingAddress getBillingAddress() {
	return billingAddress;
}
public void setBillingAddress(BillingAddress billingAddress) {
	this.billingAddress = billingAddress;
}
public ShippingAddress getShippingAddress() {
	return shippingAddress;
}
public void setShippingAddress(ShippingAddress shippingAddress) {
	this.shippingAddress = shippingAddress;
}

}
