<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

<%@include file="shared/header.jsp" %>
	<!--  http://localhost:8080/welcomehelloworld/admin/book/addBook -->
	
<form:form action="${contextPath}/admin/product/supplier/add" modelAttribute="Supplier" method="post">

<div class="row">
	<div class="col-md-offset-2 col-md-8">
		<div class="panel panel-default">
		
		<div class="panel-header">
		<h2 align="center" ><b><span style="color:#696969;">ADD SUPPLIER</span></b></h2>
		</div>
			
			<div class="panel-body">
		
		<div class="form-group">
<!-- 		<label class="col-md-2 control-label">Id:</label>
 -->		<div class="col-md-8">
			<form:hidden path ="id"  />
			<form:errors path="id"></form:errors>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-md-2 control-label"><span style="color:#696969;">Name:</span></label>
		<div class="col-md-10 ">
			<form:input type ="text" path ="name"  class="form-control" />
			<form:errors path="name" cssClass="error"></form:errors>
			<br>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-md-2 control-label"><span style="color:#696969;">Email ID:</span></label>
		<div class="col-md-10 ">
			<form:input type ="email" path ="email_Id"  class="form-control" />
			<form:errors path="email_Id" cssClass="error"></form:errors>
			<br>
		</div>
		</div>
		
		<div class="form-group">
		<label class="col-md-2 control-label"><span style="color:#696969;">Contact No:</span></label>
		<div class="col-md-10 ">
			<form:input type ="text" path ="contactNumber"  class="form-control" />
			<form:errors path="contactNumber"></form:errors>
			<br>
		</div>
		</div>
			
			<div class="form-group">
			<label class="col-md-2 control-label"><span style="color:#696969;">Address:</span></label>
			<div class="col-md-10 ">
			<form:textarea type ="text" path ="address"  class="form-control" />
			<form:errors path="address" cssClass="error"></form:errors>
			<br>
		</div>
		</div>
		
		<div class="form-group" align="center">
			<button  type="submit" value="add"  style="color: black;background:#F9D9BE;border: 1px solid #555;"  >A D D</button>
			<button type="reset" value="reset"style="color: black;background:#F9D9BE;border: 1px solid #555;"   >R E S E T</button>
			<br>
		</div>
	
	
	</div>
	</div>
	</div>
	</div>
	<table border=1 class = "table table-condensed">
				<thead>
					<tr>
						<th align="center" width="120"><span style="color:#FFFFFF;"></span>Id</th>
						<th align="center" width="120"><span style="color:#FFFFFF;"></span>Name</th>
						<th align="center" width="200"><span style="color:#FFFFFF;"></span>Address</th>
						<th align="center" width="120"><span style="color:#FFFFFF;"></span>Contact No.</th>
						<th align="center" width="120"><span style="color:#FFFFFF;"></span>Email ID</th>
						<th align="center" width="120"><span style="color:#FFFFFF;"></span>Delete</th>
						<th align="center" width="120"><span style="color:#FFFFFF;"></span>Edit</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${supplierList}" var="user">
						<tr>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"></span>${user.id}</td>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"></span>${user.name}</td>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"></span>${user.address}</td>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"></span>${user.contactNumber}</td>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"></span>${user.email_Id}</td>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"><a class="btn btn-danger" href="${contextPath}/admin/product/supplier/delete/${user.id}" >DELETE</a></span></td>
							<td style=" text-align: centre"><span style="color:#FFFFFF;"><a class="btn btn-info" href="${contextPath}/admin/product/supplier/edit/${user.id}" > E D I T </a></span></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

</form:form>
	</div>
	</div>


<%@include file="shared/footer.jsp" %>
