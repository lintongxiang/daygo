package com.daygo.dao;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.daygo.entity.Address;
import com.daygo.util.DB;

public class AddressDao {
	public void addAddress(Address address){
		DB db = new DB();
		String sql = "insert into dg_address(a_tel,a_add,a_name,u_id,a_phone,a_num,a_mail) value(?,?,?,?,?,?,? )";
		db.prepareStatement(sql);
		
		db.setString(1, address.getA_tel());
		db.setString(2,address.getA_add());
		db.setString(3, address.getA_name());
		db.setInt(4, address.getU_id());
		db.setString(5, address.getA_phone());
		db.setString(6, address.getA_num());
		db.setString(7, address.getA_mail());
		db.p_execute();
		db.close();
		
	
	}
	public void deleteAddress(int id){
		DB db = new DB();
		String sql = "delete from dg_address where a_id = ?";
		db.prepareStatement(sql);
		db.setInt(1, id);
		db.p_execute();
	}
	public void updateAddress(Address address){
		DB db = new DB();
		String sql = "update dg_address set a_tel = ?,a_add = ?,a_name = ?,a_phone=? ,a_mail=?,a_num=?"
				+ "where a_id = '"+address.getA_id()+"'";
		db.prepareStatement(sql);
		db.setString(1, address.getA_tel());
		db.setString(2,address.getA_add());
		db.setString(3, address.getA_name());
		db.setString(4, address.getA_phone());
		db.setString(5, address.getA_mail());
		db.setString(6, address.getA_num());
		db.p_execute();
		db.close();
	}
	public List<Address> queryAllAddress() throws SQLException{
		DB db = new DB();
		String sql = "select * from dg_address;";
		ResultSet resultSet = db.query(sql);
		ArrayList<Address> list = new ArrayList<Address>();
		while (resultSet.next()) {

			int a_id = resultSet.getInt("a_id");
			String a_tel = resultSet.getString("a_tel");
			String a_add = resultSet.getString("a_add");
			String a_name = resultSet.getString("a_name");
			int u_id = resultSet.getInt("u_id");
			String a_num=resultSet.getString("a_num");
			String a_mail=resultSet.getString("a_mail");
			String a_phone=resultSet.getString("a_phone");
			
			Address address = new Address();
			address.setA_id(a_id);
			address.setA_tel(a_tel);
			address.setA_add(a_add);
			address.setA_name(a_name);
			address.setU_id(u_id);
			address.setA_mail(a_mail);
			address.setA_phone(a_phone);
			address.setA_num(a_num);

			list.add(address);
			
		}
		db.close();
		return list;
	}

	public List<Address> queryByUId(int uid) throws SQLException{
		DB db = new DB();
		String sql = "select * from dg_address where u_id = ?";

		db.prepareStatement(sql);
		db.setInt(1, uid);
		ResultSet resultSet = (ResultSet) db.p_query();
		List<Address> list = new ArrayList<Address>();
		while(resultSet.next()) {

			int a_id = resultSet.getInt("a_id");
			String a_tel = resultSet.getString("a_tel");
			String a_add = resultSet.getString("a_add");
			String a_name = resultSet.getString("a_name");
			int u_id = resultSet.getInt("u_id");
			String a_num=resultSet.getString("a_num");
			String a_mail=resultSet.getString("a_mail");
			String a_phone=resultSet.getString("a_phone");
			
			Address address = new Address();
			address.setA_id(a_id);
			address.setA_tel(a_tel);
			address.setA_add(a_add);
			address.setA_name(a_name);
			address.setU_id(u_id);
			address.setA_mail(a_mail);
			address.setA_phone(a_phone);
			address.setA_num(a_num);

			
			list.add(address);
			
			
		}
		db.close();
		return list;

	}
}
