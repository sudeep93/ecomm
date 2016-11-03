package com.niit.model;


import java.io.Serializable;
import java.util.UUID;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;


@Entity
@Table(name="SUPPLIER")

public class Supplier implements Serializable   {
	
	

	/**
	 * 
	 */
	private static final long serialVersionUID = -4129118316749482805L;

	@Id
	private String id;
	
	public Supplier() {
		this.id = UUID.randomUUID().toString().substring(22, 30);
	}

	@NotBlank(message="Please enter your name")
	private String name;
	
	@NotBlank(message="Please enter the address")
	private String address;
	
	@NotBlank(message="Please enter the contactNumber")
	private String contactNumber;
	
	@NotBlank(message="please enter the email_Id")
	private String email_Id;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getEmail_Id() {
		return email_Id;
	}

	public void setEmail_Id(String email_Id) {
		this.email_Id = email_Id;
	}

}
