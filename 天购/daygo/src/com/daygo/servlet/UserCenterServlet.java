package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daygo.biz.UserBiz;
import com.daygo.biz.UserCenterBIZ;
import com.daygo.dao.OrderDao;
import com.daygo.entity.Address;
import com.daygo.entity.Order;
import com.daygo.entity.User;

public class UserCenterServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserCenterServlet() {
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
			doPost(request,response);
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
		String action=request.getParameter("action");
		String username=(String) request.getSession().getAttribute("username");
		UserCenterBIZ usercenterbiz=new UserCenterBIZ();
		if(action==null){
			action="index";
		}
		if(action.equals("index")){
			User user =usercenterbiz.getinfoByName(username);
			request.setAttribute("user", user);
			request.getRequestDispatcher("usercenter.jsp").forward(request, response);
		}else if(action.equals("info")){
			User user =usercenterbiz.getinfoByName(username);
			request.setAttribute("user", user);
			request.getRequestDispatcher("usercenter_info.jsp").forward(request, response);
		}else if(action.equals("address")){
			List<Address> list=new ArrayList();
			list=usercenterbiz.getAddressByName(username);
			request.setAttribute("addresslist", list);
			request.getRequestDispatcher("usercenter_address.jsp").forward(request, response);
		}else if(action.equals("order_list")){
			UserCenterBIZ biz=new UserCenterBIZ();
			List list=new ArrayList();
			list=biz.getOrdersByName(username);
			request.setAttribute("list", list);
			request.setAttribute("count", list.size());
			request.getRequestDispatcher("usercenter_orderlist.jsp").forward(request,response);
			
		}else if(action.equals("orderdetail")){
			String o_id=request.getParameter("o_id");
			Order order=new Order();
			OrderDao dao=new  OrderDao();
			order=dao.getOrderByOid(Integer.parseInt(o_id));
			request.setAttribute("order", order);
			List list=new ArrayList();
			list=dao.getGoodsByOid(Integer.parseInt(o_id));
			request.setAttribute("list", list);
			request.getRequestDispatcher("usercenter_orderdetail.jsp").forward(request,response);
		}else if(action.equals("deleteorder")){
			String o_id=request.getParameter("o_id");
			OrderDao dao=new  OrderDao();
			dao.deleteOrderByOid(Integer.parseInt(o_id));
			request.getRequestDispatcher("UserCenter.html?action=order_list").forward(request,response);
		}else if(action.equals("take")){
			String o_id=request.getParameter("o_id");
			OrderDao dao=new  OrderDao();
			dao.updateOrderStatus(Integer.parseInt(o_id), 3);
			request.getRequestDispatcher("UserCenter.html?action=order_list").forward(request,response);
		}else if(action.equals("comment")){
			request.getRequestDispatcher("Comment.html").forward(request, response);
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
