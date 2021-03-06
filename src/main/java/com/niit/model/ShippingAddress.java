package com.niit.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="shippingaddress")
public class ShippingAddress implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3528408544773231661L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int shippingAddressId;
private String streetName;
private String apartmentNumber;
private String city;
private String state;
private String country;
private String zipcode;

@OneToOne(mappedBy="shippingAddress",cascade=CascadeType.ALL)
private Customer customer;

public int getShippingAddressId() {
	return shippingAddressId;
}
public void setShippingAddressId(int shippingAddressId) {
	this.shippingAddressId = shippingAddressId;
}
public String getStreetName() {
	return streetName;
}
public void setStreetName(String streetName) {
	this.streetName = streetName;
}
public String getApartmentNumber() {
	return apartmentNumber;
}
public void setApartmentNumber(String apartmentNumber) {
	this.apartmentNumber = apartmentNumber;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getCountry() {
	return country;
}
public void setCountry(String country) {
	this.country = country;
}
public String getZipcode() {
	return zipcode;
}
public void setZipcode(String zipcode) {
	this.zipcode = zipcode;
}
public Customer getCustomer() {
	return customer;
}
public void setCustomer(Customer customer) {
	this.customer = customer;
}

}
