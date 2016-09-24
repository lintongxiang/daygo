package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daygo.biz.ShoppingCartBiz;
import com.daygo.biz.UserBiz;
import com.daygo.dao.ShoppingCartDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.User;
import com.daygo.util.PasswordEncoder;
import com.daygo.util.Salt;

public class LoginServlet extends HttpServlet {

	
	private static final long serialVersionUID = -4333151519187976890L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String action=request.getParameter("action");
		String kk = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
		request.setAttribute("captcha", kk);
		
		String captcha = request.getParameter("captcha");
		if(action!=null&&action.equals("iscaptcha")){
			PrintWriter out = response.getWriter();
			if(captcha!=null&&!captcha.equals(kk)){
				out.print(false);
			}else{
				out.print(true);
			}
			out.close();
			out=null;
		}
		
			
			
		
		if(action==null||action.equals(""))
			action="login";
		//登录验证
		if(action.equals("tlogin")){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			//记住密码
			String remember = request.getParameter("remember");
		
			if(remember!=null){
				Cookie usernameCookie = new Cookie("username", URLEncoder.encode(username,"utf-8"));//编码
				Cookie passwordCookie = new Cookie("password", URLEncoder.encode(password,"utf-8"));
				
				usernameCookie.setMaxAge(864000);//生命时间十天
				passwordCookie.setMaxAge(864000);
				
				response.addCookie(usernameCookie);
				response.addCookie(passwordCookie);
			}else{
				Cookie[] cookies = request.getCookies();
				if(cookies!=null&&cookies.length>0){
					for (Cookie cookie : cookies) {
						if(cookie.getName().equals("username")||cookie.getName().equals("password")){
							cookie.setMaxAge(0);//设置失效
							response.addCookie(cookie);
							
						}
					}
				}
			}

			
			
			UserBiz ubiz = new UserBiz();
			int fail = 1;
			if(ubiz.login(username, password)){
				if(captcha.equals(kk)){
					String ip = request.getHeader("x-forwarded-for");
				//	String ip=request.getRemoteAddr();
				    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
				        ip = request.getHeader("Proxy-Client-IP");    
				    }    
				    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
				        ip = request.getHeader("WL-Proxy-Client-IP");    
				    }    
				    if(ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {    
				        ip = request.getRemoteAddr();    
				    }    
				    if(ip!=null){
				    	ubiz.record(username,ip);
				    }
				request.getSession().setAttribute("username", username);
				response.sendRedirect("index.jsp");
				return;
				}
				
				else{
					fail = 2;
				}	
			}
			request.setAttribute("fail", fail);
			request.setAttribute("action", "login");
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		//注册
		if(action.equals("isreg")){
			String username = request.getParameter("username");
			PrintWriter out = response.getWriter();
			if(UserBiz.equalsname(username)){
				out.print(false);
			}else{
				out.print(true);
			}
			out.close(); 
			out=null;
		}
		if(action.equals("tregister")){
			String username = request.getParameter("username");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String tel = request.getParameter("extend_field5");
			String question = request.getParameter("sel_question");
			String answer = request.getParameter("passwd_answer");
			String captcha1 = request.getParameter("captcha");
			String salt = Salt.createSalt();
		
			PasswordEncoder encoderMd5 = new PasswordEncoder(salt, "MD5");//md5加密
			String encode = encoderMd5.encode(password);
		
			User user = new User();
			user.setU_name(username);
			user.setU_mail(email);
			user.setU_pwd(encode);
			user.setU_salt(salt);
			user.setU_tel(tel);
			user.setU_problem(question);
			user.setU_answer(answer);
		
			String k = (String)request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
			if(captcha.equals(k)){
				UserBiz.register(user);
				new ShoppingCartDao().addShoppingCart(new UserDao().getuserByname(user.getU_name()).getU_id());
				request.setAttribute("action", "login");
				request.setAttribute("registersuccess", true);
				request.getRequestDispatcher("login.jsp").forward(request, response);
			
			
				return;
			}else{
				request.setAttribute("fail", 2);
				request.setAttribute("action", "reg");
				request.getRequestDispatcher("login.jsp").forward(request, response);

			}
			
		}
		
	
		if(action.equals("login")||action.equals("reg")||action.equals("gpswname")){
			request.setAttribute("action", action);
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
	}

}
