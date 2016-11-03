<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>

<%@include file="shared/header.jsp" %>
	<!--  http://localhost:8080/welcomehelloworld/admin/book/addBook -->
	 <div class="container">
   	  <div class="w3-container">
        <div class="form" >
   	
	<c:url value="/admin/product/addProduct" var="url"></c:url> 
	<form:form method="post" action="${url}" commandName="productFormObj" enctype="multipart/form-data">
	
		
		
			<form:label path="isbn"></form:label>
			<form:hidden path="isbn" />
        
        
        <form:label path="name">TITLE</form:label>  
        <form:input path="name" class="w3-input w3-border w3-animate-input" style="width:30%"></form:input>
	    
	    <br>
	     
        <form:label path="brand">Brand</form:label>  
        <form:input path="brand" class="w3-input w3-border w3-animate-input" style="width:30%"></form:input>
	    
	     <br>
        <form:label path="productdesc">Product desc</form:label>  
        <form:input path="productdesc" class="w3-input w3-border w3-animate-input" style="width:30%"></form:input>
	    
	     <br>
        <form:label path="price">price</form:label>  
        <form:input path="price" class="w3-input w3-border w3-animate-input" style="width:30%"></form:input>
	    
	    <br>
	    
	    <form:label path="category">CATEGORY</form:label>
	    
	    <form:radiobutton path="category.cid" value="1"/>Luxury
	     <form:radiobutton path="category.cid" value="2"/>Sports	
	      <form:radiobutton path="category.cid" value="3"/>Smart 
	       <form:radiobutton path="category.cid" value="4"/>Casual
	    
	    <br>
	    <form:label path="supplierId">supplier</form:label>
	    
	   <form:select path="supplierId" cssClass="form-control">
				<form:options items="${suppliers}" class="w3-input w3-border w3-animate-input" style="width:30%"/>
			</form:select>
	     <br>
	    
	    
       <form:label path="productImage">Image</form:label>
        <form:input type="file" path="productImage" />
	     <br>
	    <input type="submit" value="AddProduct" style="color: black;background:#F9D9BE;border: 1px solid #555;">
	    

		
	</form:form>
	</div>
	</div>
	</div>


<%@include file="shared/footer.jsp" %>
