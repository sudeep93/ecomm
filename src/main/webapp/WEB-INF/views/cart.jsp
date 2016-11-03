 <%@include file="shared/header.jsp" %>


 
<a class="btn btn-danger pull-left" ng-click = "clearCart()">
 <span class="glyphicon glyphicon-remove-sign">
 </span> Clear Cart
</a>
<br><br>
	

<div class="container" ng-init="getCart(${cartId})">
</div>
<table class="table table-hover">
<thead>
<tr>
<th>TITLE</th>
<th>QUANTITY</th>
<th>Price</th>
<th>TOTAL PRICE</th>
</tr>
</thead>
<tr ng-repeat="c in cart.cartItems">

<td>
{{c.product.name}}
</td>
<td>
{{c.quantity}}
</td>
<td>
{{c.product.price}}
</td>
<td>
{{c.totalPrice}}
</td>
<td>
<a href="#" class="label label-danger" 
 ng-click="removeFromCart(c.cartItemId)">
<span class="glyphicon glyphicon-remove"></span>remove</a>
</td>
</tr>

</table>
<h3>GrandTotal Price: {{calculateGrandTotal()}}</h3>
</div>

<a href="${allproducts}" class="btn btn-default">Continue shopping</a>




<a href="<c:url value="/order/${cartId}" />" class="btn btn-success pull-right">
<span class="glyphicon glyphicon-shopping-cart"></span> 
Check out</a>


</div>
</div>
</div>




 <%@include file="shared/footer.jsp" %>
