package com.niit.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.niit.dao.CartItemDao;
import com.niit.model.Cart;
import com.niit.model.CartItem;
@Service
public class CartItemServiceImpl implements CartItemService{
	@Autowired
private CartItemDao cartItemDao;
	@Transactional
	public CartItemDao getCartItemDao() {
		return cartItemDao;
	}
	@Transactional
	public void setCartItemDao(CartItemDao cartItemDao) {
		this.cartItemDao = cartItemDao;
	}
	@Transactional
	public void addCartItem(CartItem cartItem) {
		cartItemDao.addCartItem(cartItem);
	}
	public void removeCartItem(int cartItemId) {
		cartItemDao.removeCartItem(cartItemId);		
	}

	public void removeAllCartItems(Cart cart) {
		cartItemDao.removeAllCartItems(cart);
		
	}

	
}
