 <%@include file="shared/header.jsp" %>

	
	
	
<div class="men">
    <div class="container">
    	
    	
		
    	<div class="col-md-8 mens_right">
    		<div class="dreamcrub">
			   	<ul class="breadcrumbs">
                    <li class="home">
                       <a href="/" title="Go to Home Page">Home</a>&nbsp;
                       <span>&gt;</span>
                    </li>
                    <li class="home">&nbsp;
                        Men / Women&nbsp;
                    </li>
                </ul>
                <ul class="previous">
                	<li><a href="/">Back to Previous Page</a></li>
                </ul>
                <div class="clearfix"></div>
			   </div>
			   <div class="mens-toolbar">
                 <div class="sort">
               	   <div class="sort-by">
		            <label>Sort By</label>
		            <select>
		                            <option value="">
		                    Position                </option>
		                            <option value="">
		                    Name                </option>
		                            <option value="">
		                    Price                </option>
		            </select>
		            <a href=""><img src="${ images}/arrow2.gif" alt="" class="v-middle"></a>
                   </div>
    		     </div>
    	        <ul class="women_pagenation dc_paginationA dc_paginationA06">
			     <li><a href="#" class="previous">Page : </a></li>
			     <li class="active"><a href="#">1</a></li>
			     <li><a href="#">2</a></li>
		  	    </ul>
                <div class="clearfix"></div>		
		        </div>
    		<div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
					<div class="cbp-vm-options">
						<a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected" data-view="cbp-vm-view-grid" title="grid">Grid View</a>
						<a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list" title="list">List View</a>
					</div>
					<div class="pages">   
        	 <div class="limiter visible-desktop">
               <label>Show</label>
                  <select>
                            <option value="" selected="selected">
                    9                </option>
                            <option value="">
                    15                </option>
                            <option value="">
                    30                </option>
                  </select> per page        
               </div>
       	   </div>
					<div class="clearfix"></div>
					<ul>
					
					<c:url value="resources/images/{{b.isbn}}.png" var="src" />
					
					  <li class="simpleCart_shelfItem" ng-repeat="b in products | filter:searchCondition">
							<a class="cbp-vm-image"  href="getProductByIsbn/{{b.isbn}}">
							 <div class="view view-first">
					   		  <div class="inner_content clearfix">
								<div class="product_image">
									<div class="mask1"><img id="yourImg" src="${src }"  alt="image" class="img-responsive zoom-img"></div>
									<div class="mask">
			                       		<div class="info">Quick View</div>
					                 </div>
					                 <div class="product_container">
									   <h4>{{b.name}}</h4>
									   <p>Watch</p>
									   <div class="price mount item_price">Rs. {{b.price}}</div>
<!-- 									   <a class="button item_add cbp-vm-icon cbp-vm-add" href="#">Add to cart</a> -->
									   
		<security:authorize ifAnyGranted="ROLE_ADMIN">
		<a href="admin/product/editProduct/{{b.isbn }}"><span class="glyphicon glyphicon-edit"></span></a>
		<a href="admin/delete/{{b.isbn }}"><span class="glyphicon glyphicon-trash"></span></a>
		
		</security:authorize>
		
									 </div>	
									 	
								  </div>
			                     </div>
		                      </div>
		                      
		                    </a>
						</li>
						
					</ul>	
			</div>
    	</div>
    	
    </div>
   </div>
   <script>
   $('#yourImg').bttrlazyloading({
		sm: {
			src: 'http://placekitten.com/380/380'
		}
	});
   </script>
		<script src="${js}/cbpViewModeSwitch.js" type="text/javascript"></script>
                <script src="${js}/classie.js" type="text/javascript"></script>

	
<%@include file="shared/footer.jsp" %>