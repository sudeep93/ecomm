package com.niit.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty; 

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="users")
public class Users  implements Serializable  {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 3711134173179736109L;
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
private int userId;
	@NotEmpty(message="Username can not be empty!")
private String username;
private String password;
private boolean enabled;
@JsonIgnore
@OneToOne(mappedBy="users",cascade=CascadeType.ALL)
private Customer customer;


public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public int getUserId() {
	return userId;
}
public void setUserId(int userId) {
	this.userId = userId;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}

public boolean isEnabled() {
	return enabled;
}
public void setEnabled(boolean enabled) {
	this.enabled = enabled;
}
public Customer getCustomer() {
	return customer;
}
public void setCustomer(Customer customer) {
	this.customer = customer;
}

}
