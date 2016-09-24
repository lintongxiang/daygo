package com.daygo.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.daygo.util.DB;
import com.daygo.entity.Goods;
import com.daygo.entity.ShoppingCart;

public class ShoppingCartDao {
	
	public static Integer UidtoSid(int u_id) {
		DB db = new DB();
		String sql="select s_id from dg_shoppingcart where u_id="+u_id+"";
		ResultSet rs=db.query(sql);
		try {
			if(rs.next()){
				return rs.getInt("s_id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}
	public List<ShoppingCart> selectshopCart(int s_id) throws SQLException{
		DB db=new DB();
		String sql="select * from dg_rel_shoppingcart_goods  where s_id = "+s_id+"";
		ResultSet rs=db.query(sql);
		ArrayList<ShoppingCart> list = new ArrayList<ShoppingCart>();
		while(rs.next()){
			ShoppingCart shc = new ShoppingCart();
			shc.setG_id(rs.getInt("g_id"));
			shc.setS_id(rs.getInt("s_id"));
			shc.setG_size(rs.getString("g_size"));
			shc.setS_number(rs.getInt("s_number"));
			list.add(shc);
		}
		db.close();
		return list;
	}

	public boolean insertshopCart(ShoppingCart shc){
		DB db=new DB();
		String sql="select * from "+DB.PREFIX+"rel_shoppingcart_goods where s_id=? and g_id=? and g_size=?";
		db.prepareStatement(sql);
		db.setInt(1, shc.getS_id());
		db.setInt(2, shc.getG_id());
		db.setString(3, shc.getG_size());
		ResultSet res=db.p_query();
		try {
			if(res.next()){
				DB db1=new DB();
				String sql1="update "+DB.PREFIX+"rel_shoppingcart_goods set s_number=? where g_id=? and s_id=?";
				db1.prepareStatement(sql1);
				db1.setInt(1, res.getInt("s_number")+shc.getS_number());
				db1.setInt(2, shc.getG_id());
				db1.setInt(3, shc.getS_id());
				boolean f=db1.p_execute();
				db1.close();
				return f;
			}else{
				DB db1=new DB();
				String sql1="insert into "+DB.PREFIX+"rel_shoppingcart_goods(s_id,g_id,g_size,s_number) values(?,?,?,?)";
				db1.prepareStatement(sql1);
				db1.setInt(1, shc.getS_id());
				db1.setInt(2, shc.getG_id());
				db1.setString(3, shc.getG_size());
				db1.setInt(4, shc.getS_number());
				boolean f=db1.p_execute();
				db1.close();
				return f;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateshopCart(ShoppingCart shc){
		DB db=new DB();
		String sql="update dg_rel_shoppingcart_goods set g_number="+shc.getS_number()+",g_size='"+shc.getG_size()+"' where s_id="+shc.getS_id()+" and g_id="+shc.getG_id()+"";
		boolean bl=db.execute(sql);
		db.close();
		return bl;
	}
	
	public boolean removeGoodsFromCart(ShoppingCart shc){
		DB db=new DB();
		String sql="delete from dg_rel_shoppingcart_goods where g_id='"+shc.getG_id()+"'and s_id="+shc.getS_id()+"";
		Boolean bl=db.execute(sql);
		db.close();

		return bl;
	}
	public boolean removeAll(int s_id){
		DB db=new DB();
		String sql="delete from dg_rel_shoppingcart_goods where  s_id="+s_id+"";
		Boolean bl=db.execute(sql);
		db.close();

		return bl;
	}
	public List<Goods> getAllGoods(List<ShoppingCart> list){
		ArrayList<Goods> li=new ArrayList<Goods>();
		try {
			for(int i=0;i<list.size();i++){
				DB db=new DB();
				String sql="select * from "+DB.PREFIX+"goods where g_id=?";
				db.prepareStatement(sql);
				db.setInt(1, list.get(i).getG_id());
				ResultSet res=db.p_query();
				if(res.next()){
					Goods goods=new Goods();
					goods.setG_id(res.getInt(1));
					goods.setG_describe(res.getString(2));
					goods.setG_category(res.getString(3));
					goods.setG_size(res.getString(4));
					goods.setG_name(res.getString(5));
					goods.setG_number(res.getInt(6));
					goods.setG_price(res.getDouble(7));
					goods.setG_picture(res.getString(8));
					li.add(goods);
				}
				db.close();
			}
			return li;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public boolean removeGoods(ShoppingCart shc){
		DB db=new DB();
		String sql="delete from dg_rel_shoppingcart_goods where g_id=? and s_id=? and g_size=?";
		db.prepareStatement(sql);
		db.setInt(1, shc.getG_id());
		db.setInt(2, shc.getS_id());
		db.setString(3, shc.getG_size());
		Boolean bl=db.p_execute();
		db.close();

		return bl;
	}
	
	public int updateNumber(int sid,String[] number){
		try {
			DB d=new DB();
			String sql="select * from "+DB.PREFIX+"rel_shoppingcart_goods where s_id=?";
			d.prepareStatement(sql);
			d.setInt(1, sid);
			ResultSet res=d.p_query();
			int i=0;
			int[] id=new int[number.length];
			while(res.next()){
				id[i++]=res.getInt("g_id");
			}
			d.close();
			for(i=0;i<number.length;i++){
				DB db=new DB();
				String s="update "+DB.PREFIX+"rel_shoppingcart_goods set s_number="+number[i]+" where s_id="+sid+" and g_id="+id[i];
				db.execute(s);
				db.close();
			}
			return number.length;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1;
	}
	
	public int createOrder(int s_id,int u_id) throws SQLException{
		double totalprice=0;
		DB db=new DB();
		db.prepareStatementw("insert into "+DB.PREFIX+"orders(o_time,o_status) values(?,?)",Statement.RETURN_GENERATED_KEYS)
				.set(1, new Date(new java.util.Date().getTime())).setInt(2, 1).p_execute();
		ResultSet rs=db.getGeneratedKeys();
		int o_id=0;
		if(rs.next()){
			o_id=rs.getInt(1);
		}
		db.close();
		if(o_id==0)
			return 0;
		db=new DB();
		String sql="select * from "+DB.PREFIX+"rel_shoppingcart_goods where s_id=?";
		db.prepareStatement(sql);
		db.setInt(1, s_id);
		ResultSet res=db.p_query();
		while(res.next()){
			DB d=new DB();
			ResultSet rr=d.prepareStatement("select g_price from "+DB.PREFIX+"goods where g_id=?").setInt(1, res.getInt("g_id")).p_query();
			double price=0;
			if(rr.next()){
				price=rr.getInt("g_price");
			}
			d.close();
			totalprice+=res.getInt("s_number")*price;
			d=new DB();
			d.prepareStatement("insert into "+DB.PREFIX+"rel_user_orders_goods(u_id,o_id,g_id,g_number,g_size,g_price) "
					+ "values(?,?,?,?,?,?)").setInt(1, u_id).setInt(2, o_id).setInt(3, res.getInt("g_id"))
					.setInt(4,res.getInt("s_number")).setString(5, res.getString("g_size")).setDouble(6, price).p_execute();
			d.close();
		}
		db.close();
		db=new DB();
		db.prepareStatement("update "+DB.PREFIX+"orders set o_totalprice=? where o_id=?").setDouble(1,totalprice).setInt(2, o_id).p_execute();
		db.close();
		return o_id;
	}
	
	public void addShoppingCart(int u_id){
		DB db=new DB();
		String sql="insert into "+DB.PREFIX+"shoppingcart(s_id,u_id) values(?,?)";
		db.prepareStatement(sql);
		db.setInt(1, u_id);
		db.setInt(2, u_id);
		db.p_execute();
	}

}
