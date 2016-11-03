package com.niit.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.niit.model.Product;
import com.niit.model.Cart;
import com.niit.model.CartItem;
import com.niit.model.Customer;
import com.niit.services.ProductService;
import com.niit.services.CartItemService;
import com.niit.services.CustomerService;
import com.niit.services.CartService;

@Controller
public class CartItemController {
	
//it needs CartItemService
@Autowired	
private CustomerService customerService;
@Autowired
private ProductService productService;
@Autowired
private CartItemService cartItemService;
@Autowired
private CartService cartService;

public CartItemService getCartItemService() {
	return cartItemService;
}


public void setCartItemService(CartItemService cartItemService) {
	this.cartItemService = cartItemService;
}


public CustomerService getCustomerServices() {
	return customerService;
}


public void setCustomerService(CustomerService customerService) {
	this.customerService = customerService;
}


public ProductService getProductService() {
	return productService;
}


public void setProductService(ProductService productService) {
	this.productService = productService;
}

public CartService getCartService() {
	return cartService;
}


public void setCartService(CartService cartService) {
	this.cartService = cartService;
}






@ResponseStatus(value=HttpStatus.NO_CONTENT)
@RequestMapping(value="/cart/add/{isbn}",method=RequestMethod.PUT)
public void addCartItem(@PathVariable(value="isbn") int isbn){
	//Is to get the username of the customer
	//User object contains details about the user -username , password, activeuser or not
	User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String username=user.getUsername();
	Customer customer=customerService.getCustomerByUsername(username);
	System.out.println("Customer is " + customer.getCustomerEmail() );
	Cart cart=customer.getCart();
	
	
	
	
	
	
	
	List<CartItem> cartItems=cart.getCartItems();
	Product product=productService.getProductByIsbn(isbn);
	for(int i=0;i<cartItems.size();i++){
		CartItem cartItem=cartItems.get(i);
		if(product.getIsbn()==cartItem.getProduct().getIsbn()){
			cartItem.setQuantity(cartItem.getQuantity() + 1);
			cartItem.setTotalPrice(cartItem.getQuantity() * cartItem.getProduct().getPrice());
			cartItemService.addCartItem(cartItem);
			return;
		}

	}
	CartItem cartItem=new CartItem();
	cartItem.setQuantity(1);
	cartItem.setProduct(product);
	cartItem.setTotalPrice(product.getPrice() * 1);
	cartItem.setCart(cart);
	cartItemService.addCartItem(cartItem);
	
	
}
@RequestMapping("/cart/removecartitem/{cartItemId}")
@ResponseStatus(value=HttpStatus.NO_CONTENT)
public void removeCartItem(
	@PathVariable(value="cartItemId") int cartItemId){
	cartItemService.removeCartItem(cartItemId);
}

@RequestMapping("/cart/removeAllItems/{cartId}")
@ResponseStatus(value=HttpStatus.NO_CONTENT)
public void removeAllCartItems(@PathVariable(value="cartId") int cartId){
	Cart cart=cartService.getCartByCartId(cartId);
	cartItemService.removeAllCartItems(cart);
}

}
