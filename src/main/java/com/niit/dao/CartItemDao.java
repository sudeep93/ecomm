package com.niit.dao;

import java.util.List;

import com.niit.model.Cart;
import com.niit.model.CartItem;

public interface CartItemDao {
void addCartItem(CartItem cartItem);
void removeCartItem(int cartItemId);
void removeAllCartItems(Cart cart);


}

