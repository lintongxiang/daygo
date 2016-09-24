package com.daygo.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.daygo.entity.Goods;
import com.daygo.util.DB;

public class GoodsDao {
	public boolean AddGoods(Goods goods)
	{
		DB db=new DB();
		 String sql="insert into  "+db.PREFIX+"goods(" +
		 		"g_describe,g_category,g_size,g_name,g_number,g_price,g_picture,u_id) values(?,?,?,?,?,?,?,?)";
		 db.prepareStatement(sql);
		 db.setString(1, goods.getG_describe());
		 db.setString(2, goods.getG_category());
		 db.setString(3, goods.getG_size());
		 db.setString(4, goods.getG_name());
		 db.setInt(5, goods.getG_number());
		 db.setDouble(6, goods.getG_price());
		 db.setString(7, goods.getG_picture());
		 db.setInt(8, goods.getU_id());
		 boolean flag=db.p_execute();
		 db.close();
		 return flag;
	}
	public boolean DeleteGoodsById(int id)
	{
		DB db=new DB();
		String sql="delete from "+db.PREFIX+"goods where g_id='"+id+"'" ;
		db.prepareStatement(sql);
		boolean flag=db.p_execute();
		return flag;
	}
	public List GetGoodsByKey(String key)
	{
		List<Goods> list=new ArrayList();
		DB db=new DB();
		String sql="select *  from "+db.PREFIX+"goods " +
				"where g_name like '%"+key+"%' or g_category like '%"+key+"%' ";
		 db.prepareStatement(sql);
		 ResultSet res=db.p_query();
		 try {
		 while(res.next())
			{
			Goods goods=new Goods();
			goods.setG_id(res.getInt(1));
			goods.setG_describe(res.getString(2));
			goods.setG_category(res.getString(3));
			goods.setG_size(res.getString(4));
			goods.setG_name(res.getString(5));
			goods.setG_number(res.getInt(6));
			goods.setG_price(res.getDouble(7));
			goods.setG_picture(res.getString(8));
			list.add(goods);
			} 
		 db.close();
		 	return list;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
			return list;
	}
	public boolean UpdateGoods(Goods goods)
	{
		DB db=new DB();
		 String sql="update   "+db.PREFIX+"goods " +
		 		"set g_describe=?,g_category=?,g_size=?,g_name=?,g_number=?,g_price=?,g_picture=? " +
		 		"where g_id='"+goods.getG_id()+"'";
		 db.prepareStatement(sql);
		 db.setString(1, goods.getG_describe());
		 db.setString(2, goods.getG_category());
		 db.setString(3, goods.getG_size());
		 db.setString(4, goods.getG_name());
		 db.setInt(5, goods.getG_number());
		 db.setDouble(6, goods.getG_price());
		 db.setString(7, goods.getG_picture());
		 boolean flag=db.p_execute();
		 db.close();
		 return flag;
	}
	
	public Goods SelectGoods(int gid){
		DB db=new DB();
		String sql="select *  from "+db.PREFIX+"goods " +
				"where g_id=?";
		 db.prepareStatement(sql);
		 db.setInt(1, gid);
		 ResultSet res=db.p_query();
		 try {
		 Goods goods=new Goods();
		 while(res.next())
			{
			goods.setG_id(res.getInt(1));
			goods.setG_describe(res.getString(2));
			goods.setG_category(res.getString(3));
			goods.setG_size(res.getString(4));
			goods.setG_name(res.getString(5));
			goods.setG_number(res.getInt(6));
			goods.setG_price(res.getDouble(7));
			goods.setG_picture(res.getString(8));
			goods.setU_id(res.getInt(9));
			} 
		 	db.close();
			return goods;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
		return null;
	}
	
	public ArrayList<Goods> getGoodsByCatory(String category){
		DB db=new DB();
		String sql="select *  from "+db.PREFIX+"goods " +
				"where g_category like '%"+category+"%'";
		 db.prepareStatement(sql);
	//	 db.setString(1, category);
		 ResultSet res=db.p_query();
		 ArrayList<Goods> list=new ArrayList<Goods>();
		 try {
		 
		 while(res.next())
			{
			 Goods goods=new Goods();
			goods.setG_id(res.getInt(1));
			goods.setG_describe(res.getString(2));
			goods.setG_category(res.getString(3));
			goods.setG_size(res.getString(4));
			goods.setG_name(res.getString(5));
			goods.setG_number(res.getInt(6));
			goods.setG_price(res.getDouble(7));
			goods.setG_picture(res.getString(8));
			goods.setU_id(res.getInt(9));
			list.add(goods);
			} 
		 	db.close();
			return list;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
		return null;
	}
	
	public ArrayList<Goods> getGoodsByCatoryAndKey(String catogery,String key){
		DB db=new DB();
		String sql="select *  from "+db.PREFIX+"goods " +
				"where g_catogery like '%"+catogery+"%' and g_name like '%"+key+"%' or g_category like '%"+catogery+"%'";
		 db.prepareStatement(sql);
		 ResultSet res=db.p_query();
		 ArrayList<Goods> list=new ArrayList<Goods>();
		 try {
		 
		 while(res.next())
			{
			 Goods goods=new Goods();
			goods.setG_id(res.getInt(1));
			goods.setG_describe(res.getString(2));
			goods.setG_category(res.getString(3));
			goods.setG_size(res.getString(4));
			goods.setG_name(res.getString(5));
			goods.setG_number(res.getInt(6));
			goods.setG_price(res.getDouble(7));
			goods.setG_picture(res.getString(8));
			goods.setU_id(res.getInt(9));
			list.add(goods);
			} 
		 	db.close();
			return list;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			db.close();
		return null;
	}
}
