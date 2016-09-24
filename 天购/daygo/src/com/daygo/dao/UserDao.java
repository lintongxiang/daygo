package com.daygo.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.daygo.util.DB;
import com.daygo.entity.User;

public class UserDao {
public boolean AddUser(User user)
{
	DB db=new DB();
		 String sql="insert into  "+db.PREFIX+"user(" +
		 		"u_name,u_pwd,u_salt,u_problem,u_sex,u_answer,u_tel,u_mail,u_sid) values(?,?,?,?,?,?,?,?,?)";
		 db.prepareStatement(sql);
		 db.setString(1, user.getU_name());
		 db.setString(2, user.getU_pwd());
		 db.setString(3, user.getU_salt());
		 db.setString(4, user.getU_problem());
		 db.setInt(5, user.getU_sex());
		 db.setString(6, user.getU_answer());
		 db.setString(7, user.getU_tel());
		 db.setString(8, user.getU_mail());
		 //db.set(9, user.getU_lasttime());
		 //db.setString(9, user.getU_lastip());
		 db.setInt(9, user.getU_sid());
		 boolean flag=db.p_execute();
		 db.close();
		 return flag;
}
public boolean Updateinfo(User user){
	boolean flag=false;
	DB db=new DB();
	String sql="update "+db.PREFIX+"user set u_sex=?,u_tel=?,u_mail=?  ,u_problem=?,u_answer=? where u_name='"+user.getU_name()+"'";
	db.prepareStatement(sql);
	db.setInt(1, user.getU_sex());
	db.setString(2, user.getU_tel());
	db.setString(3, user.getU_mail());
	db.setString(2, user.getU_problem());
	db.setString(3, user.getU_answer());
	flag=db.p_execute();
	db.close();
	return flag;
}
public boolean Updatelast(String username,Date date,String ip)
{
	boolean flag=false;
	DB db=new DB();
	String sql="update "+db.PREFIX+"user set u_lasttime=?,u_lastip=?   where u_name='"+username+"'";
	db.prepareStatement(sql);
	db.set(1, date);
	db.setString(2, ip);
	flag=db.p_execute();
	db.close();
	return flag;
	}
public boolean Updatepwd(int u_id,String pwd)
{
	boolean flag=false;
	DB db=new DB();
	String sql="update "+db.PREFIX+"user set u_pwd=? where u_id='"+u_id+"'";
	db.prepareStatement(sql);
	db.setString(1, pwd);
	flag=db.p_execute();
	db.close();
	return flag;
	}
public User getuserByid(int id)
{
	DB db=new DB();
	User user=new User();
	String sql="select * from "+db.PREFIX+"user  where u_id='"+id+"'";
	db.prepareStatement(sql);
	ResultSet res=db.p_query();
	try {
		while(res.next())
		{
			user.setU_id(res.getInt(1));
			user.setU_name(res.getString(2));
			user.setU_pwd(res.getString(3));
			user.setU_salt(res.getString(4));
			user.setU_problem(res.getString(5));
			user.setU_answer(res.getString(6));
			user.setU_sex(res.getInt(7));
			user.setU_tel(res.getString(8));
			user.setU_mail(res.getString(9));
			user.setU_lasttime(res.getTimestamp(10));
			user.setU_lastip(res.getString(11));
			user.setU_sid(res.getInt(12));
			
		}
		db.close();
		return user;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	db.close();
	return null;
	}
public User getuserByname(String name)
{
	DB db=new DB();
	User user=new User();
	String sql="select * from "+db.PREFIX+"user  where u_name=?";
	db.prepareStatement(sql);
	db.setString(1, name);
	ResultSet res=db.p_query();
	try {
		while(res.next())
		{
			user.setU_id(res.getInt(1));
			user.setU_name(res.getString(2));
			user.setU_pwd(res.getString(3));
			user.setU_salt(res.getString(4));
			user.setU_problem(res.getString(5));
			user.setU_answer(res.getString(6));
			user.setU_sex(res.getInt(7));
			user.setU_tel(res.getString(8));
			user.setU_mail(res.getString(9));
			user.setU_lasttime(res.getTimestamp(10));
			user.setU_lastip(res.getString(11));
			user.setU_sid(res.getInt(12));
			
		}
		return user;
	} catch (SQLException e) {
		e.printStackTrace();
	}
	return null;
	}

}


