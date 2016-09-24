package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daygo.biz.ShoppingCartBiz;
import com.daygo.dao.UserDao;
import com.daygo.entity.Goods;
import com.daygo.entity.ShoppingCart;

public class ShoppingCartServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ShoppingCartServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String action=request.getParameter("action");
			String username=(String) request.getSession().getAttribute("username");
			if(action==null||"".equals(action)){
				ShoppingCartBiz biz=new ShoppingCartBiz();
				List<ShoppingCart> slist=biz.GetCart(username);
				List<Goods> glist=biz.getAllGoods(slist);
				request.setAttribute("slist", slist);
				request.setAttribute("glist", glist);
				if(slist.size()!=0)
					request.setAttribute("totalprice", biz.countTotalPrice(slist, glist));
				request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
			}else if(action.equals("add")){
				String id=request.getParameter("id");
					boolean f=new ShoppingCartBiz().addGoods(Integer.parseInt(id),new UserDao().getuserByname(username).getU_id(),
							request.getParameter("size"),Integer.parseInt(request.getParameter("number")));
					request.setAttribute("success", true);
					response.sendRedirect("ShoppingCart.html");
			}else if(action.equals("delete")){
				String size=request.getParameter("size");
				size=new String(size.getBytes("ISO-8859-1"),"utf-8");
				String sid=request.getParameter("sid");
				String gid=request.getParameter("gid");
				ShoppingCartBiz biz=new ShoppingCartBiz();
				boolean f=biz.removeGoods(Integer.parseInt(sid), Integer.parseInt(gid), size);
				response.sendRedirect("ShoppingCart.html");
			}else if(action.equals("clear")){
				new ShoppingCartBiz().removeAllGoods(new UserDao().getuserByname(username).getU_id());
				response.sendRedirect("ShoppingCart.html");
			}else if(action.equals("update")){
				int count=new ShoppingCartBiz().GetCart(username).size();
				String[] number=new String[count];
				for(int i=0;i<count;i++){
					number[i]=request.getParameter("number"+i);
				}
				int res=new ShoppingCartBiz().updateNumber(new UserDao().getuserByname(username).getU_id(),number);
				response.sendRedirect("ShoppingCart.html");
			}
		}catch (Exception e) {
			response.sendRedirect("error.jsp");
			e.printStackTrace();
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
