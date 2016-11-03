   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@taglib prefix="cd" uri="http://www.springframework.org/tags" %>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %> 
    <%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ page isELIgnored="false"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    <spring:url value="/resources/css" var="css"/>
    <spring:url value="/resources/js" var="js"/>
    <spring:url value="/resources/images" var="images"/>
    <c:url value="/productsList" var="allproducts" />
    <c:url value="/" var="index" />

<html>
<head>
<title>Watches </title>
<script src="${js}/angular.min.js"> </script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Watches" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="${css}/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!-- Custom Theme files -->
<link href="${css}/style.css" rel='stylesheet' type='text/css' />
 <link rel="stylesheet"  href="${css}/style1.css" type='text/css'/>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.0/jquery.js"></script>
<link href="${css}/component.css" rel='stylesheet' type='text/css' />
<!-- Custom Theme files -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





        
        
        
        

<!--webfont-->
<link href="${css}/webfont.css" rel='stylesheet' type='text/css'>
<link href="${css}/webfont1.css" rel='stylesheet' type='text/css'>
<script type="text/javascript" src="${js}/jquery-1.11.1.min.js"></script>
<!-- start menu -->
<link href="${css}/megamenu.css" rel="stylesheet" type="text/css" media="all" />
<link href="${css}/animate.css" rel='stylesheet' type='text/css' />
<script type="text/javascript" src="${js}/megamenu.js"></script>
<script type="text/javascript" src="${js}/controller.js"></script>



<script>$(document).ready(function(){$(".megamenu").megamenu();});</script>
<script src="${js}/jquery.easydropdown.js"></script>
<script src="${js}/simpleCart.min.js"> </script>
<script src="${js}/controller.js"> </script>
<script src="${js}/cbpViewModeSwitch.js" type="text/javascript"></script>
                <script src="${js}/classie.js" type="text/javascript"></script>
<script src="${js}/easyResponsiveTabs.js" type="text/javascript"></script>
<script type="text/javascript">
			    $(document).ready(function () {
			        $('#horizontalTab').easyResponsiveTabs({
			            type: 'default', //Types: default, vertical, accordion           
			            width: 'auto', //auto or any width like 600px
			            fit: true   // 100% fit in a container
			        });
			    });
            </script>
</head>
<body ng-app="app" ng-controller="myController" ng-init="getAllProducts()">
		
	<div class="men_banner animated fadeInDown">
   	  <div class="container ">
   	  	<div class="header_top">
   	  	   <div class="header_top_left">
   	  	   <security:authorize access="hasRole('ROLE_USER')">
	  	      <div class="box_11"><a href="<c:url value="/cart/getCartId"/>">
		      <h4><p>Cart:</span>{{quantity}} </p><img src="${images}/bag.png" alt=""/><div class="clearfix"> </div></h4>
		      </a></div>
		      
	          <p class="empty"><a href="javascript:;" class="simpleCart_empty">Empty Cart</a></p>
	           </security:authorize>
	          <div class="clearfix"> </div>
	       </div>
	      
           <div class="header_top_right">
		  	 
			 <ul class="header_user_info animated pulse">
			<!--  when the user not logged in -->
		<c:if test="${pageContext.request.userPrincipal.name ==null }">
			<li><a href="<c:url value="/login"></c:url>">Login</a></li>
			<c:url value="/customer/registration" var="url"></c:url>
			<li><a href="${url }">Register</a></li>
			</c:if>

			<c:if test="${pageContext.request.userPrincipal.name!=null}" >
			<li class="user_desc"><a>Welcome ${pageContext.request.userPrincipal.name }</a></li>
			<li class="user_desc"><a href="<c:url value="/j_spring_security_logout"></c:url>">logout</a></li>
		</c:if >

			  <div class="clearfix"> </div>
		     </ul>
		    <!-- start search-->
				<div class="search-box">
				   <div id="sb-search" class="sb-search">
					  <form>
						 <input class="sb-search-input" ng-model="searchCondition" placeholder="Search watch">
						 <input class="sb-search-submit" type="submit" value="search">
						 <span class="sb-icon-search"> </span>
					  </form>
				    </div>
				 </div>
				 <!----search-scripts---->
				 <script src="${js}/classie1.js"></script>
				 <script src="${js}/uisearch.js"></script>
				   <script>
					 new UISearch( document.getElementById( 'sb-search' ) );
				   </script>
					<!----//search-scripts---->
		            <div class="clearfix"> </div>
			 </div>
		     <div class="clearfix"> </div>
	    </div>
   	  <div class="header_bottom animated fadeInDown">
	   <div class="logo animated fadeInDown">
		  <h1><a href="${index}"><span class="m_1">W</span>owtches</a></h1>
	   </div>
	   <div class="menu">
	     <ul class="megamenu skyblue">
			<li class="grid"><a class="color2" href="${index}">Home</a>
			<li class="active grid">
			<a class="color2" href="${allproducts}">Mens</a>
				<div class="megapanel">
					<div class="row">
					<div class="col1">
							<div class="h_nav animated fadeInDown">
								<h4 >Men </h4>
								<ul>
									<li><a href="${allproducts}">Watches</a></li>
									<li><a href="${allproducts}">Accessories</a></li>
								</ul>	
							</div>							
						</div>
						
						
						<div class="col2">
							<div class="h_nav animated fadeInDown">
								<h4>Trends</h4>
								<ul>
									<li >
										<div class="p_left">
										  <img src="${images}/p1.jpg" class="img-responsive" alt=""/>
										</div>
										<div class="p_right">
											<h4><a href="#">Luxury Watches</a></h4>
											<span class="item-cat"><small><a href="#">watches</a></small></span>
											<span class="price">Rs. 20,999</span>
										</div>
										<div class="clearfix"> </div>
									</li>
									<li>
										<div class="p_left">
										  <img src="${images}/p2.jpg" class="img-responsive" alt=""/>
										</div>
										<div class="p_right">
											<h4><a href="#">Casual Watch</a></h4>
											<span class="item-cat"><small><a href="#">watches</a></small></span>
											<span class="price">Rs. 2,999</span>
										</div>
										<div class="clearfix"> </div>
									</li>
									<li>
										<div class="p_left">
										  <img src="${images}/p3.jpg" class="img-responsive" alt=""/>
										</div>
										<div class="p_right">
											<h4><a href="#">Smart Watch</a></h4>
											<span class="item-cat"><small><a href="#">watches</a></small></span>
											<span class="price">Rs. 2,999</span>
										</div>
										<div class="clearfix"> </div>
									</li>
								</ul>	
							</div>												
						</div>
					  </div>
					</div>
			</li>
			<li><a class="color4" href="#">womens</a>
				<div class="megapanel">
					<div class="row">
						
						<div class="col1">
							<div class="h_nav animated fadeInDown">
								<h4>Women</h4>
								<ul>
									<li><a href="${allproducts}">Watches</a></li>
									
									<li><a href="${allproducts}">Accessories</a></li>
								</ul>	
							</div>							
						</div>
						<div class="col2">
							<div class="h_nav animated fadeInDown">
								<h4>Trends</h4>
								<ul>
									<li class>
										<div class="p_left">
										  <img src="${images}/p1.jpg" class="img-responsive" alt=""/>
										</div>
										<div class="p_right">
											<h4><a href="#">Denim shirt</a></h4>
											<span class="item-cat"><small><a href="#">watches</a></small></span>
											<span class="price">Rs. 2,999</span>
										</div>
										<div class="clearfix"> </div>
									</li>
									<li>
										<div class="p_left">
										  <img src="${images}/p2.jpg" class="img-responsive" alt=""/>
										</div>
										<div class="p_right">
											<h4><a href="#">Denim shirt</a></h4>
											<span class="item-cat"><small><a href="#">watches</a></small></span>
											<span class="price">Rs. 2,999</span>
										</div>
										<div class="clearfix"> </div>
									</li>
									<li>
										<div class="p_left">
										  <img src="${images}/p3.jpg" class="img-responsive" alt=""/>
										</div>
										<div class="p_right">
											<h4><a href="#">Denim shirt</a></h4>
											<span class="item-cat"><small><a href="#">watches</a></small></span>
											<span class="price">Rs. 2,999</span>
										</div>
										<div class="clearfix"> </div>
									</li>
								</ul>	
							</div>												
						</div>
					  </div>
					</div>
				</li>				
		
				<li><a class="color10" href="${allproducts}">Brands</a></li>
				<li><a class="color3" href="index">Sale</a></li>
				<li><a class="color7" href="404">News</a></li>
					<!--  User has logged in  -->
		<c:if test="${pageContext.request.userPrincipal.name!=null}" >
		<security:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="<c:url value="/admin/product/addProduct"/>">Add New
						Product</a></li>
						
					<li><a href="<c:url value="/admin/product/supplier/add"/>">add supplier</a></li>
			</security:authorize>
		</c:if >

			
				
				</ul>
			</div>
	        <div class="clearfix"> </div>
	    </div>
	  </div>
   </div>
			