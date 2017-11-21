package com.doa;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;





import org.hibernate.criterion.Restrictions;

import com.model.CafeteriaDetails;
import com.model.Cart;
import com.model.Menu;
//import com.sun.mail.imap.Utility;
import com.utility.Connection;


public class DAO {

	private SessionFactory sessionFactory = Connection.getSessionFactory();
	String status = "failed";

	public List<Menu> doGetMenuListItems(String menu) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Integer cityId = 0;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria cr =session.createCriteria(Menu.class);
			cr.add(Restrictions.eq("srNo",Integer.parseInt(menu)));
			List<Menu> list=cr.list();
			System.out.println("list:"+list);
			for(Menu obj:list)
			{
				System.out.println("menu :"+obj.getIndex()+"  srno:"+obj.getSrNo()+"  menu:"+menu);
			}
			tx.commit();
			System.out.println(list);
			return list;
					
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public Object doAddCart(Cart cart) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			session.save(cart);
			tx.commit();
			return "1";
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return "0";
		} finally {
			session.close();
		}
	}

	public List<Cart> doGetCartList(int userid) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Integer cityId = 0;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria cr =session.createCriteria(Cart.class);
			cr.add(Restrictions.eq("userid",userid));
			List<Cart> list=cr.list();
			tx.commit();
			System.out.println(list);
			return list;
					
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public Menu doGetItemForCart(int i) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			System.out.println("itemId:"+i);
			Criteria cr = session.createCriteria(Menu.class);
			cr.add(Restrictions.eq("itemId",i));
			List<Menu> list=(List)cr.list();
			tx.commit();
			System.out.println(list);
			return list.get(0);
					
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

	public boolean itemInCart(Cart cart) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Integer cityId = 0;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria cr = session.createCriteria(Cart.class);
			cr.add(Restrictions.eq("itemId",cart.getItemId()));
			cr.add(Restrictions.eq("userid",cart.getUserid()));
			cr.add(Restrictions.eq("srNo",cart.getSrNo()));
			List<Menu> list=cr.list();
			tx.commit();
			System.out.println(list);
			if(list.size()>0)
				return true;
			else
				return false;
					
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean updateCartItemQty(Cart cart) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria cr=session.createCriteria(Cart.class);
			cr.add(Restrictions.eq("itemId",cart.getItemId()));
			cr.add(Restrictions.eq("userid",cart.getUserid()));
			cr.add(Restrictions.eq("srNo",cart.getSrNo()));
			List results = cr.list();   
			Cart obj=(Cart) results.get(0);
			
			obj.setQty(""+(Integer.parseInt(obj.getQty())+Integer.parseInt(cart.getQty())));
			
			
			session.update(obj);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean doDeleteItemFromCart(String itemId, int userid/*, String srNO*/) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		Integer cityId = 0;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();

			Criteria cr=session.createCriteria(Cart.class);
			cr.add(Restrictions.eq("itemId",Integer.parseInt(itemId)));
			cr.add(Restrictions.eq("userid",userid));	/*
			cr.add(Restrictions.eq("srNo", Integer.parseInt(srNO)));*/
			List results = cr.list();   
			Cart obj=(Cart) results.get(0);
			session.delete(obj);
			
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public boolean updateCartItemQty(String itemid, String qty, int userid/*, String srNo*/) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria cr=session.createCriteria(Cart.class);
			cr.add(Restrictions.eq("itemId",Integer.parseInt(itemid)));
			cr.add(Restrictions.eq("userid",userid));
		/*	cr.add(Restrictions.eq("srNo", srNo));
			*/List results = cr.list();   
			Cart obj=(Cart) results.get(0);
			
			obj.setQty(qty);
			
			
			session.update(obj);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	public List<CafeteriaDetails> getCafeteriaDetailsList() {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = sessionFactory.openSession();
			tx = session.beginTransaction();
			Criteria cr = session.createCriteria(CafeteriaDetails.class);
			List<CafeteriaDetails> list=(List)cr.list();
			tx.commit();
			return list;
					
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return null;
		} finally {
			session.close();
		}
	}

}
