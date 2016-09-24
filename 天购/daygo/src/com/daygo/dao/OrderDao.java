package com.daygo.dao;

import java.sql.*;
import java.util.ArrayList;

import com.daygo.entity.*;
import com.daygo.util.*;
public class OrderDao {
	public ArrayList<Order> getOrdersByUid(int u_id){
		DB db=new DB();
		String sql="select distinct o_id from "+DB.PREFIX+"rel_user_orders_goods where u_id=? ";
		db.prepareStatement(sql);
		db.setInt(1, u_id);
		ResultSet res=db.p_query();
		ArrayList<Order> list=new ArrayList<Order>();
		try {
			while(res.next()){
				int id=res.getInt("o_id");
				DB db1=new DB();
				ResultSet r=db1.query("select * from "+DB.PREFIX+"orders where o_id="+id);
				if(r.next()){
					Order order=new Order();
					order.setO_id(r.getInt("o_id"));
					order.setO_status(r.getInt("o_status"));
					order.setO_time(r.getDate("o_time"));
					order.setO_totalprice(r.getDouble("o_totalprice"));
					list.add(order);
				}
				db1.close();
			}
			db.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return null;
	}
	
	public Order getOrderByOid(int o_id){
		DB db=new DB();
		String sql="select * from "+DB.PREFIX+"orders where o_id=?";
		db.prepareStatement(sql);
		db.setInt(1, o_id);
		ResultSet res=db.p_query();
		try {
			Order order=new Order();
			if(res.next()){
				order.setO_id(res.getInt("o_id"));
				order.setO_status(res.getInt("o_status"));
				order.setO_time(res.getDate("o_time"));
				order.setO_totalprice(res.getDouble("o_totalprice"));
			}
			db.close();
			return order;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return null;
	}
	
	public boolean updateOrderStatus(int o_id,int o_status){
		DB db=new DB();
		String sql="update "+DB.PREFIX+"orders set o_status=? where o_id=?";
		db.prepareStatement(sql);
		db.setInt(1, o_status);
		db.setInt(2, o_id);
		boolean success=db.p_execute();
		db.close();
		return success;
	}
	
	public boolean deleteOrderByOid(int o_id){
		DB db=new DB();
		String sql="delete from "+DB.PREFIX+"orders where o_id=?";
		db.prepareStatement(sql);
		db.setInt(1, o_id);
		boolean s1=db.p_execute();
		db.close();
		db=new DB();
		sql="delete from "+DB.PREFIX+"rel_user_orders_goods where o_id=?";
		db.prepareStatement(sql);
		db.setInt(1, o_id);
		boolean s2=db.p_execute();
		db.close();
		System.out.println(s1);
		System.out.println(s2);
		return s1&&s2;
	}
	
	public ArrayList<Order> getOrdersByPage(int page,int size){
		DB db=new DB();
		String sql="select * from "+DB.PREFIX+"orders order by o_time desc limit ?,?";
		db.prepareStatement(sql);
		db.setInt(1, (page-1)*size);
		db.setInt(2, size);
		ResultSet res=db.p_query();
		ArrayList<Order> list=new ArrayList<Order>();
		try {
			while(res.next()){
				Order order=new Order();
				order.setO_id(res.getInt("o_id"));
				order.setO_status(res.getInt("o_status"));
				order.setO_time(res.getDate("o_time"));
				order.setO_totalprice(res.getDouble("o_totalprice"));
				list.add(order);
			}
			db.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return null;
	}
	
	public ArrayList<Goods> getGoodsByOid(int o_id){
		DB db=new DB();
		String sql="select g_id,g_number,g_size,g_price from "+DB.PREFIX+"rel_user_orders_goods where o_id=?";
		db.prepareStatement(sql);
		db.setInt(1, o_id);
		ResultSet res=db.p_query();
		ArrayList<Goods> list=new ArrayList<Goods>();
		try {
			while(res.next()){
				int id=res.getInt("g_id");
				DB db1=new DB();
				ResultSet r=db1.query("select * from "+DB.PREFIX+"goods where g_id="+id);
				if(r.next()){
					Goods goods=new Goods();
					goods.setG_name(r.getString("g_name"));
					goods.setG_category(r.getString("g_category"));
					goods.setG_describe(r.getString("g_describe"));
					goods.setG_number(res.getInt("g_number"));
					goods.setG_picture(r.getString("g_picture"));
					goods.setG_price(res.getDouble("g_price"));
					goods.setG_size(res.getString("g_size"));
					goods.setG_id(r.getInt("g_id"));
					list.add(goods);
				}
				db1.close();
			}
			db.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		db.close();
		return null;
	}
	
}
