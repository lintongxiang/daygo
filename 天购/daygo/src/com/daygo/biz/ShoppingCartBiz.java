package com.daygo.biz;

import java.sql.SQLException;
import java.util.ArrayList;



import java.util.List;

import com.daygo.dao.ShoppingCartDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.Goods;
import com.daygo.entity.ShoppingCart;

public class ShoppingCartBiz {

	public void  addGoodsInCart(Goods goods,int number,int uid) throws SQLException
	{
		ShoppingCart sc = new ShoppingCart(ShoppingCartDao.UidtoSid(uid),goods.getG_id(),goods.getG_size(),number);
		ShoppingCartDao dao = new ShoppingCartDao();
		dao.insertshopCart(sc);
	}
	public void removeGoodsFromCart(int uid,int gid,String size) throws SQLException
	{
		ShoppingCart sc = new ShoppingCart();
		sc.setG_id(gid);
		sc.setS_id(ShoppingCartDao.UidtoSid(uid));
		ShoppingCartDao dao = new ShoppingCartDao();
		dao.removeGoodsFromCart(sc);

	}
	public void removeAllGoods(int uid) throws SQLException
	{
		ShoppingCartDao dao = new ShoppingCartDao();
		dao.removeAll(ShoppingCartDao.UidtoSid(uid));

	}
	public void UpdateCart(ShoppingCart sc,int uid) throws SQLException
	{
		ShoppingCartDao dao = new ShoppingCartDao();
		sc.setS_id(ShoppingCartDao.UidtoSid(uid));
		dao.updateshopCart(sc);
	}
	public ArrayList<ShoppingCart> GetCart(String username) 
	{
		UserDao udao = new UserDao();
		int uid = udao.getuserByname(username).getU_id();
		
		ShoppingCartDao dao = new ShoppingCartDao();
		
		ArrayList<ShoppingCart> list;
		try {
			list = (ArrayList<ShoppingCart>) dao.selectshopCart(ShoppingCartDao.UidtoSid(uid));
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	public int TotalPrice(int number,int price){
		return number*price;		
		
	}
	public boolean  addGoods(int g_id,int u_id,String g_size,int g_number) 
	{
		ShoppingCart sc = new ShoppingCart(ShoppingCartDao.UidtoSid(u_id),g_id,g_size,g_number);
		ShoppingCartDao dao = new ShoppingCartDao();
		boolean f=dao.insertshopCart(sc);
		return f;
	}
	public List<Goods> getAllGoods(List<ShoppingCart> list){
		if(list==null)
			return null;
		ArrayList<Goods> li=new ArrayList<Goods>();
		ShoppingCartDao dao=new ShoppingCartDao();
		li=(ArrayList<Goods>) dao.getAllGoods(list);
		return li;
	}
	public int countTotalPrice(List<ShoppingCart> slist,List<Goods> glist){
		int count=0;
		for(int i=0;i<slist.size();i++){
			count+=slist.get(i).getS_number()*glist.get(i).getG_price();
		}
		return count;
	}
	public boolean removeGoods(int sid,int gid,String size) throws SQLException
	{
		ShoppingCart sc = new ShoppingCart();
		sc.setG_id(gid);
		sc.setG_size(size);
		sc.setS_id(sid);
		ShoppingCartDao dao = new ShoppingCartDao();
		boolean f=dao.removeGoods(sc);
		return f;
	}
	
	public int updateNumber(int uid,String[] number) throws SQLException{
		int res=0;
		res = new ShoppingCartDao().updateNumber(ShoppingCartDao.UidtoSid(uid),number);
		return res;
	}
	
	public int createOrder(int uid){
		try {
			return new ShoppingCartDao().createOrder(ShoppingCartDao.UidtoSid(uid), uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
	}
}
