package com.service;

import java.util.List;

import com.doa.DAO;
import com.model.Cart;
import com.model.Menu;
import com.model.CafeteriaDetails;

public class Services {

	DAO dao = new DAO();
	

	public List<Menu> doGetMenuListItems(String menu) {
		// TODO Auto-generated method stub
		
		return dao.doGetMenuListItems(menu);
	}


	public Object doAddCart(Cart cart) {
		// TODO Auto-generated method stub
		return dao.doAddCart(cart);
	}


	public List<Cart> doGetCartList(int userid) {
		// TODO Auto-generated method stub
		return dao.doGetCartList(userid);
	}


	public Menu doGetItemForCart(int i) {
		// TODO Auto-generated method stub
		return dao.doGetItemForCart(i);
	}


	public boolean itemInCart(Cart cart) {
		// TODO Auto-generated method stub
		return dao.itemInCart(cart);
	}


	public boolean updateCartItemQty(Cart cart) {
		// TODO Auto-generated method stub
		return dao.updateCartItemQty(cart);
	}


	public boolean doDeleteItemFromCart(String itemId, int userid/*, String srNO*/) {
		// TODO Auto-generated method stub
		return dao.doDeleteItemFromCart(itemId,userid/*,srNO*/);
	}


	public boolean updateCartItemQty(String itemid, String qty, int userid/*, String srNo*/) {
		// TODO Auto-generated method stub
		return dao.updateCartItemQty( itemid, qty,userid/*,srNo*/);
	}


	public List<CafeteriaDetails> getCafeteriaDetailsList() {
		// TODO Auto-generated method stub
		return dao.getCafeteriaDetailsList();
	}
}
