<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
<%@ page isELIgnored="false"%>
<%@ include file="/WEB-INF/views/shared/header.jsp" %>
	
	 
	 
	
	 
	 <div class="men">
   	<div class="container">
	 <!--  http://localhost:8080/welcomehelloworld/admin/product/addProduct -->
	 
	<c:url value="/admin/product/editProduct" var="url"></c:url> 
	<form:form method="post" action="${url}" commandName="editProductObj" enctype="multipart/form-data">
		 <div class="account-in">
   	 <div class="container">
		<table>
		
		<tr class="account-in">
	
			<td><form:label path="isbn" readonly="true" size="8"  disabled="true"></form:label></td>
			<td><form:hidden path="isbn" /></td>
       
        </tr >
       
        <tr class="account-in">
        <td><form:label path="name">TITLE</form:label>  </td>
        <td><form:input path="name" ></form:input></td>
	    </tr >
	    
	     <tr>
        <td><form:label path="brand">Brand</form:label>  </td>
        <td><form:input path="brand" ></form:input></td>
	    </tr>
	     <tr>
        <td><form:label path="productdesc">Product desc</form:label>  </td>
        <td><form:input path="productdesc" ></form:input></td>
	    </tr>
	     <tr>
        <td><form:label path="price">price</form:label>  </td>
        <td><form:input path="price" ></form:input></td>
	    </tr>
	    
	    <tr>
	    <td><form:label path="category">CATEGORY</form:label></td>
	    <td>
	    <form:radiobutton path="category.cid" value="1"/>Luxury
	     <form:radiobutton path="category.cid" value="2"/>Sports	
	      <form:radiobutton path="category.cid" value="3"/>Smart 
	       <form:radiobutton path="category.cid" value="4"/>Casual
	    </td>
	    </tr>
	    <tr>
	    <td><form:label path="productImage">Image</form:label>
        <td><form:input type="file" path="productImage" /></td>
	    </tr>
	    <tr>
	    <td colspan="2"><input type="submit" value="EditProduct" class="btn btn-default"></td>
	    </tr>
		</table>
		</div>
		</div>
	</form:form>

</div>
</div>
<%@ include file="/WEB-INF/views/shared/footer.jsp" %>