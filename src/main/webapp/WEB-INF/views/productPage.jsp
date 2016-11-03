<%@include file="shared/header.jsp" %>
<c:url value="/resources/images/${productObj.isbn }.png" var="src" />
   <div class="men">
   	<div class="container">
      <div class="col-md-9 single_top">
      	<div class="single_left">
      	  <div class="labout span_1_of_a1">
			<div class="flexslider">
					 <ul class="slides">
						<li data-thumb="${src }">
							<img src="${src }" />
						</li>
						<li data-thumb="${src }">
							<img src="${src }" />
						</li>
						<li data-thumb="${src }">
							<img src="${src }" />
						</li>
						<li data-thumb="${src }">
							<img src="${src }" />
						</li>
					 </ul>
				  </div>
		          <div class="clearfix"></div>	
	    </div>
		<div class="cont1 span_2_of_a1 simpleCart_shelfItem">
				<h1> ${productObj.name }</h1>
				<p class="availability">Availability: <span class="color">In stock</span></p>
			    <div class="price_single">
				  <span class="reducedfrom">Rs. ${productObj.price +productObj.price*20/100}</span>
				  <span class="amount item_price actual">Rs. ${productObj.price }</span><a href="#">click for offer</a>
				</div>
				<h2 class="quick">Quick Overview:</h2>
				<p class="quick_desc">${productObj.productdesc}</p>
			    <div class="wish-list">
				 	<ul>
				 		<li class="wish"><a href="#">Add to Wishlist</a></li>
				 	    <li class="compare"><a href="#">Add to Compare</a></li>
				 	</ul>
				 </div>
				<ul class="size">
					<h3>Length</h3>
					<li><a href="#">On Size</a></li>
				</ul>
				<div class="quantity_box">
					<ul class="product-qty">
					   <span>Quantity:</span>
					   <select>
						 <option>1</option>
						 <option>2</option>
						 <option>3</option>
						 <option>4</option>
						 <option>5</option>
						 <option>6</option>
					   </select>
				    </ul>
				    <ul class="single_social">
						<li><a href="#"><i class="fb1"> </i> </a></li>
						<li><a href="#"><i class="tw1"> </i> </a></li>
						<li><a href="#"><i class="g1"> </i> </a></li>
						<li><a href="#"><i class="linked"> </i> </a></li>
		   		    </ul>
		   		    <div class="clearfix"></div>
	   		    </div>
	   		    <c:url value="/cart/add/${productObj.isbn }" var="url"></c:url>
	      		
              <security:authorize access="hasRole('ROLE_USER')">
	      	<a href="#" ng-click="addToCart(${productObj.isbn})" class="btn btn-primary btn-normal btn-inline btn_form button item_add item_1" target="_self">Add to cart</a>
	      		
	      	    </security:authorize>
			</div>
		    <div class="clearfix"> </div>
		</div>
        <div class="sap_tabs">	
	       <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
			  <ul class="resp-tabs-list">
			  	  <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>Product Description</span></li>
				  <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>Additional Information</span></li>
				  <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>Reviews</span></li>
			  </ul>				  	 
			  <div class="resp-tabs-container">
			    <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
					<div class="facts">
					  <ul class="tab_list">
					  </ul>           
			        </div>
			     </div>	
			      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
					<div class="facts">
					  <ul class="tab_list">
					    </ul>           
			        </div>
			     </div>	
			      <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
			        <div class="facts">
					  <ul class="tab_list">
					  	</ul>  
					</div>    
			     </div>	
			  </div>
		    </div>
		  </div>	
		</div><div class="col-md-3 tabs">
	      <h3 class="m_1">Related Products</h3>
	      <ul class="product">
	      	<li class="product_img"><img src="images/m5.jpg" class="img-responsive" alt=""/></li>
	      	<li class="product_desc">
	      		<h4><a href="#">quod mazim</a></h4>
	      		<p class="single_price">$66.30</p>
	      		<c:url value="/cart/add/${productObj.isbn }" var="url"></c:url>
	      		<div ng-controller="ProductController">
              <security:authorize access="hasRole('ROLE_USER')">
	      		
	      	    <a href="#" ng-click="addToCart(${productObj.isbn})"  class="link-cart">Add to Cart</a>
	      	    </security:authorize>
	        </li>
	      	<div class="clearfix"> </div>
	      </ul>
	      
        </div>
     <div class="clearfix"> </div>
	</div>
   </div>
   <!-- FlexSlider -->
<script defer src="${js}/jquery.flexslider.js"></script>
<link rel="stylesheet" href="${css}/flexslider.css" type="text/css" media="screen" />
<script>
// Can also be used with $(document).ready()
$(window).load(function() {
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails"
  });
});
</script>
<%@include file="shared/footer.jsp" %>
