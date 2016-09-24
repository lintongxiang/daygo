package com.daygo.biz;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.daygo.dao.AddressDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.Address;
import com.daygo.entity.User;

public class AddressBiz {
public List<Address> getaddress(String username)
{
	List<Address> list;
	UserDao userdao=new UserDao();
	User user=userdao.getuserByname(username);
	AddressDao addressdao=new AddressDao();
	try {
		list=addressdao.queryByUId(user.getU_id());
		return list;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
	}
public void deleteaddress(int aid)
{
	AddressDao addressdao=new AddressDao();
	addressdao.deleteAddress(aid);
	}
public void updateaddress(Address address)
{
	AddressDao addressdao=new AddressDao();
	addressdao.updateAddress(address);
	}
public void insertaddress(Address address)
{
	AddressDao addressdao=new AddressDao();
	addressdao.addAddress(address);
	}
}

