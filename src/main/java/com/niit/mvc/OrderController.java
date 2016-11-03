package com.niit.mvc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.model.Cart;
import com.niit.model.Customer;
import com.niit.model.CustomerOrder;
import com.niit.services.CartService;
import com.niit.services.CustomerOrderService;


@Controller
public class OrderController {
	@Autowired
    private CartService cartService;

    @Autowired
    private CustomerOrderService customerOrderService;

    @RequestMapping("/order/{cartId}")
    public String createOrder(@PathVariable("cartId") int cartId){
        CustomerOrder customerOrder = new CustomerOrder();
        Cart cart = cartService.getCartByCartId(cartId);
        //UPDATE CARTID FOR CUSTOMERORDER - SET CARTID
        customerOrder.setCart(cart);

        Customer customer = cart.getCustomer();
        //SET CUSTOMERID
        customerOrder.setCustomer(customer);
        //SET BILLINGADDRESSID
        customerOrder.setBillingAddress(customer.getBillingAddress());
        //SET SHIPPINGADDRESSID
        customerOrder.setShippingAddress(customer.getShippingAddress());

        customerOrderService.addCustomerOrder(customerOrder);

        return "redirect:/checkout?cartId=" + cartId;

    }

}
