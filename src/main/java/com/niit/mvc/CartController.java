package com.niit.mvc;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.services.CartServiceImpl;
import com.niit.services.CustomerService;

@Controller
public class CartController {
@Autowired
private CustomerService customerService;
@Autowired
private CartServiceImpl cartService;
@Autowired
public CartServiceImpl getCartService() {
	return cartService;
}

public void setCartService(CartServiceImpl cartService) {
	this.cartService = cartService;
}

public CustomerService getCustomerService() {
		return customerService;
	}

	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}

@RequestMapping("/cart/getCartId")
public String getCartId(Model model){
	User user=(User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String username=user.getUsername();
	
	Customer customer=customerService
	  .getCustomerByUsername(username);
	model.addAttribute("cartId",customer.getCart().getCartId());
	return "cart";
}
@RequestMapping("/cart/getCart/{cartId}")
public @ResponseBody Cart getCartItems(@PathVariable(value="cartId") int cartId){
System.out.println("Get Cart in CartController ");
Cart cart=cartService.getCartByCartId(cartId);
System.out.println("cart id " +cart.getCartId());
System.out.println(" list of items " + cart.getCartItems());
return cart;
}


}

