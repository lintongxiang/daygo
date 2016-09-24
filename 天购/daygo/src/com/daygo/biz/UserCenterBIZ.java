package com.daygo.biz;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.daygo.dao.AddressDao;
import com.daygo.dao.OrderDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.Address;
import com.daygo.entity.Order;
import com.daygo.entity.User;

public class UserCenterBIZ {
	public UserCenterBIZ(){
		
	}
	public User getinfoByName(String name){
		UserDao userdao=new UserDao();
		return userdao.getuserByname(name);
	}
	public User getinfoById(int id){
		UserDao userdao=new UserDao();
		return userdao.getuserByid(id);
	}
	public List getAddressById(int id) {
		List<Address> list=new ArrayList();
		AddressDao addressdao=new AddressDao();
		try {
			list=addressdao.queryByUId(id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	public List getAddressByName(String name){
		List<Address> list=new ArrayList();
		AddressDao addressdao=new AddressDao();
		UserDao userdao=new UserDao();
		User user= userdao.getuserByname(name);
		try {
			list=addressdao.queryByUId(user.getU_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List getOrdersByName(String name){
		List<Order> list=new ArrayList<Order>();
		UserDao userdao=new UserDao();
		User user=userdao.getuserByname(name);
		OrderDao dao=new OrderDao();
		list=dao.getOrdersByUid(user.getU_id());
		return list; 
	}

}

