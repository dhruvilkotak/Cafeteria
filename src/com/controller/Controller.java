package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.model.CafeteriaDetails;
import com.model.Menu;
import com.model.Cart;
import com.model.CartItemList;
import com.service.Services;

public class Controller extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String actionCode = request.getParameter("actionCode");
		PrintWriter out = response.getWriter();
		Services services = new Services();
		HttpSession session = request.getSession();
		String menu=request.getParameter("menu");
		/*
		
		if (session.getAttribute("user_id") == null)
		{
			session.setAttribute("cartItemList", null);
			response.sendRedirect(request.getContextPath()+ "/login.jsp");
			return;
		}
		*/
		int userid=(int)session.getAttribute("user_id");
		
		
		if (actionCode.equals("doGetListofItems"))
		{
			List<CafeteriaDetails> cafeteriaList=services.getCafeteriaDetailsList();
			if(menu==null)
			{
				menu=""+cafeteriaList.get(0).getSrNo();
			}
			CafeteriaDetails cafeName=cafeteriaList.get(0);
			for(CafeteriaDetails obj:cafeteriaList)
			{
				if(menu.equals(""+obj.getSrNo()))
				{
					cafeName=obj;
				}
			}
			List<Menu> menuList=services.doGetMenuListItems(menu);
			request.setAttribute("cafeteriaList", cafeteriaList);
			request.setAttribute("menuItemList", menuList);
			List<CartItemList> cartitemLists=getCartList(userid,services);
			session.setAttribute("cartItemList", cartitemLists);
			request.setAttribute("cafeName", cafeName);
			RequestDispatcher rd =request.getRequestDispatcher("/Menu2.jsp"); 
			rd.forward(request,response);
		}
		if (actionCode.equals("getItemsOfCart"))
		{
			List<CartItemList> cartitemLists=getCartList(userid,services);
			session.setAttribute("cartItemList", cartitemLists);
			RequestDispatcher rd =request.getRequestDispatcher("/"+request.getParameter("page")+".jsp"); 
			rd.forward(request,response);
			
		}
		if (actionCode.equals("addItemToCart"))
		{
			Cart cart=new Cart();
			cart.setItemId(Integer.parseInt(request.getParameter("itemId")));
			cart.setQty(request.getParameter("qty"));
			cart.setUserid(userid);
			cart.setCafeteriaName(request.getParameter("cafeteriaName"));
			cart.setSrNo(Integer.parseInt(request.getParameter("srNo")));
			if(!services.itemInCart(cart))
			{
				if(!services.doAddCart(cart).equals("1"))
				{
					//error
					System.out.println("erro1");
				}
				else
				{
					System.out.println("item  added cart");
				}
			}
			else
			{
				if(!services.updateCartItemQty(cart))
				{
					//error
					//out.println("erro2");
				}
			}
			List<CartItemList> cartitemLists=getCartList(userid,services);
			session.setAttribute("cartItemList", cartitemLists);
			List<CafeteriaDetails> cafeteriaList=services.getCafeteriaDetailsList();
			if(menu==null)
			{
				menu=""+cafeteriaList.get(0).getSrNo();
			}
			CafeteriaDetails cafeName=cafeteriaList.get(0);
			for(CafeteriaDetails obj:cafeteriaList)
			{
				if(menu.equals(""+obj.getSrNo()))
				{
					cafeName=obj;
				}
			}
			List<Menu> menuList=services.doGetMenuListItems(menu);
			request.setAttribute("cafeteriaList", cafeteriaList);
			request.setAttribute("menuItemList", menuList);
			request.setAttribute("cafeName", cafeName);
			RequestDispatcher rd =request.getRequestDispatcher("/Menu2.jsp"); 
			rd.forward(request,response);
		}
		if (actionCode.equals("deleteItemToCart"))
		{
			if(services.doDeleteItemFromCart(request.getParameter("itemId"),userid/*,request.getParameter("srNo")*/))
			{
				List<CartItemList> cartitemLists=getCartList(userid,services);
				session.setAttribute("cartItemList", cartitemLists);
				
			}
			if(request.getParameter("page").equals("Menu2"))
			{
				List<CafeteriaDetails> cafeteriaList=services.getCafeteriaDetailsList();
				if(menu==null)
				{
					menu=""+cafeteriaList.get(0).getSrNo();
				}
				CafeteriaDetails cafeName=cafeteriaList.get(0);
				for(CafeteriaDetails obj:cafeteriaList)
				{
					if(menu.equals(""+obj.getSrNo()))
					{
						cafeName=obj;
					}
				}
				List<Menu> menuList=services.doGetMenuListItems(menu);
				request.setAttribute("cafeteriaList", cafeteriaList);
				request.setAttribute("menuItemList", menuList);
				List<CartItemList> cartitemLists=getCartList(userid,services);
				session.setAttribute("cartItemList", cartitemLists);
				request.setAttribute("cafeName", cafeName);
				
			}
				RequestDispatcher rd =request.getRequestDispatcher("/"+request.getParameter("page")+".jsp"); 
				rd.forward(request,response);
		}
		if (actionCode.equals("updateItemToCart"))
		{
			String itemid=request.getParameter("itemid");
			String qty=request.getParameter("qty");
			/*String srNo=request.getParameter("srNo");
			*/if(!services.updateCartItemQty(itemid,qty,userid))
			{
				System.out.println("error");
			}
			try
			{
				List<CartItemList> cartitemLists=getCartList(userid,services);
				session.setAttribute("cartItemList", cartitemLists);
			
				JSONObject json      = new JSONObject();
				//JSONArray  supplierDetails = new JSONArray();
				response.setContentType("application/json");
				response.getWriter().write(json.toString());
			
			}
			catch(Exception e)
			{
				RequestDispatcher rd =request.getRequestDispatcher("/viewCart.jsp"); 
				rd.forward(request,response);
	
			}
		}
		if (actionCode.equals("updateComment"))
		{
			String comment=request.getParameter("comment");
			
			try
			{
				List<CartItemList> cartitemLists=getCartList(userid,services);
				session.setAttribute("comment", comment);
			
				JSONObject json      = new JSONObject();
				//JSONArray  supplierDetails = new JSONArray();
				response.setContentType("application/json");
				response.getWriter().write(json.toString());
			
			}
			catch(Exception e)
			{
				RequestDispatcher rd =request.getRequestDispatcher("/viewCart.jsp"); 
				rd.forward(request,response);
	
			}
		}
	}

	private List<com.model.CartItemList> getCartList(int userid, Services services) {
		// TODO Auto-generated method stub
		List<Cart> cartList=services.doGetCartList(userid);
		List<CartItemList> cartitemLists=new ArrayList<CartItemList>();
		for(Cart obj:cartList)
		{
			Menu menu=services.doGetItemForCart(obj.getItemId());	
			CartItemList cartItemList=new CartItemList();
			cartItemList.setId(obj.getId());
			cartItemList.setItemId(obj.getItemId());
			cartItemList.setQty(obj.getQty());
			cartItemList.setCafeteriaName(obj.getCafeteriaName());
			cartItemList.setSrNo(menu.getSrNo());
			cartItemList.setItemCategory(menu.getItemDescription());
			cartItemList.setItemImage(menu.getItemImage());
			cartItemList.setItemDescription(menu.getItemDescription());
			cartItemList.setItemName(menu.getItemName());
			cartItemList.setItemPrice(menu.getItemPrice());
			cartitemLists.add(cartItemList);
		/*	map.put(obj.getItemId(), cartItemList);
		*/
		}
		return cartitemLists;
	}

	
}
