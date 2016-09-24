package com.daygo.test;

import java.sql.Date;

import org.junit.Test;

import com.daygo.dao.UserDao;
import com.daygo.entity.User;

import junit.framework.TestCase;
public class userdaotest  {

	@Test
	public void Updateinfo()
	{
		UserDao userdao=new UserDao();
		User user=new User();
		user.setU_name("a");
		user.setU_mail("sddddddddddddd");
		user.setU_sex(1);
		user.setU_tel("2165165121");
		userdao.Updateinfo(user);
	}
	@Test
	public void Updatelast()
	{
		Date date=new Date(new java.util.Date().getTime());
		String ip="192.168.111.2";
		UserDao userdao=new UserDao();
		userdao.Updatelast("xiang",date,ip);
	}
	@Test
	public void Updatepwd()
	{
		UserDao userdao=new UserDao();
		userdao.Updatepwd(1,"ccccc");
	}
	@Test
	public void getuserByid()
	{
		UserDao userdao=new UserDao();
		User user=userdao.getuserByid(1);
			System.out.println(user.getU_id());
			System.out.println(user.getU_name());
			System.out.println(user.getU_pwd());
			System.out.println(user.getU_salt());
			System.out.println(user.getU_problem());
			System.out.println(user.getU_answer());
			System.out.println(user.getU_sex());
			System.out.println(user.getU_tel());
			System.out.println(user.getU_mail());
			System.out.println(user.getU_lasttime());
			System.out.println(user.getU_lastip());
	}
	@Test
	public void getuserByname()
	{
		UserDao userdao=new UserDao();
		User user=userdao.getuserByname("sss");
			System.out.println(user.getU_id());
			System.out.println(user.getU_name());
			System.out.println(user.getU_pwd());
			System.out.println(user.getU_salt());
			System.out.println(user.getU_problem());
			System.out.println(user.getU_answer());
			System.out.println(user.getU_sex());
			System.out.println(user.getU_tel());
			System.out.println(user.getU_mail());
			System.out.println(user.getU_lasttime());
			System.out.println(user.getU_lastip());
	}
}
