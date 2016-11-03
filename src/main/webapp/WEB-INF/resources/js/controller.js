




var app=angular.module("app",[])
.controller("myController",function($scope,$http){
	
	
	$scope.getAllProducts = function(){
		   $http.get('http://localhost:8080/com.niit/getAllProducts').success(function (data){
		       $scope.products = data;
		})
	}

   $scope.addToCart=function(isbn){
	   $http.put('http://localhost:8080/com.niit/cart/add/'+isbn).success(function(){
		   alert('Added Successfully');
	   })
   }
   $scope.refreshCart=function(){
   	$http.get('http://localhost:8080/com.niit/cart/getCart/'+ $scope.cartId).success(function(data){
   		$scope.cart=data;
  	});
   } 
   $scope.getCart=function(cartId){
	$scope.cartId=cartId;
   	$scope.refreshCart(cartId);
   }
   
   $scope.removeFromCart=function(cartItemId){
   	    	$http.put(
'http://localhost:8080/com.niit/cart/removecartitem/'+cartItemId)
   	.success(function(){
   		$scope.refreshCart();
   	})
   }
   
   $scope.clearCart=function(){
   	    	$http.put(
'http://localhost:8080/com.niit/cart/removeAllItems/'+$scope.cartId)
   	.success(function(){
   		$scope.refreshCart();
   	});
   }
   
   $scope.calculateGrandTotal=function(){
   	var grandTotal=0.0
   	for(var i=0;i<$scope.cart.cartItems.length;i++)
   		grandTotal=grandTotal+$scope.cart.cartItems[i].totalPrice;
   	return grandTotal;
   }
});


