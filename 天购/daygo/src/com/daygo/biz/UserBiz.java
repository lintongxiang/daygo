package com.daygo.biz;

import java.util.ArrayList;
import java.util.Date;

import com.daygo.dao.UserDao;
import com.daygo.entity.User;
import com.daygo.util.PasswordEncoder;

public class UserBiz {
	public boolean login(String username, String password){
		
		UserDao dao = new UserDao();
		User user = new User();
		user = dao.getuserByname(username);
		PasswordEncoder encoderMd5 = new PasswordEncoder(user.getU_salt(), "MD5");
	     boolean passwordValid = encoderMd5.isPasswordValid(user.getU_pwd(), password);
		if(user!=null && passwordValid){
			return true;
		}
		return false;
	}
	public static boolean equalsname(String username){
		UserDao dao = new UserDao();
		if(dao.getuserByname(username).getU_name()!=null){
			return true;
		}
		return false;
		
	}
	public boolean record(String username, String ip){
		UserDao dao = new UserDao();
		return dao.Updatelast(username, new Date(), ip);
	}
	public static void register(User user){
		
		UserDao userdao=new UserDao();
		userdao.AddUser(user);
		
	}
	
	public String  changepwd(String username,String oldpwd,String newpwd,String newpwd2)
	{
		String msg="";
		UserDao userdao=new UserDao();
		User user=userdao.getuserByname(username);
		PasswordEncoder pwde=new PasswordEncoder(user.getU_salt(),"md5");
		if(pwde.isPasswordValid(user.getU_pwd(), oldpwd))
		{
			
			if(newpwd.equals(newpwd2))
			{
				userdao.Updatepwd(user.getU_id(), pwde.encode(newpwd));
				msg="修改成功";
			}
			else
			{
				msg="两次密码输入错误";
			}
		}
		else
		{
			msg="原始密码输入错误";
		}
		return msg;
	}
}
