package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daygo.biz.AddressBiz;
import com.daygo.biz.PayBIZ;
import com.daygo.biz.ShoppingCartBiz;
import com.daygo.dao.OrderDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.Order;

public class PayServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PayServlet() {
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

		try{
			String action=request.getParameter("action");
			String username=(String) request.getSession().getAttribute("username");
			if(action==null){
				action="index";
			}
			String oid=request.getParameter("id");
			int id=-1;
			if(oid!=null){
				id=Integer.parseInt(request.getParameter("id"));
				OrderDao dao=new OrderDao();
				Order order=new Order();
				order=dao.getOrderByOid(id);
				request.setAttribute("order", order);
			}
			if(action=="index"){
				request.getRequestDispatcher("pay.jsp").forward(request, response);
			}else if(action.equals("pay")){
				new PayBIZ().pay(id);
				request.setAttribute("success",true);
				request.getRequestDispatcher("pay.jsp").forward(request, response);
			}else if(action.equals("cartpay")){
				int o_id=new ShoppingCartBiz().createOrder(new UserDao().getuserByname(username).getU_id());
				if(o_id>0){
					new ShoppingCartBiz().removeAllGoods(new UserDao().getuserByname(username).getU_id());
					Order order=new Order();
					OrderDao dao=new  OrderDao();
					order=dao.getOrderByOid(o_id);
					request.setAttribute("order", order);
					List list=new ArrayList();
					list=dao.getGoodsByOid(o_id);
					request.setAttribute("list", list);
					List alist=new ArrayList();
					alist=new AddressBiz().getaddress(username);
					request.setAttribute("alist", alist);
					request.getRequestDispatcher("cartpay.jsp").forward(request,response);
					
				}else{
					throw new Exception();
				}
			}else if(action.equals("orderpay")){
				Order order=new Order();
				OrderDao dao=new  OrderDao();
				order=dao.getOrderByOid(id);
				request.setAttribute("order", order);
				List list=new ArrayList();
				list=dao.getGoodsByOid(id);
				request.setAttribute("list", list);
				List alist=new ArrayList();
				alist=new AddressBiz().getaddress(username);
				request.setAttribute("alist", alist);
				request.getRequestDispatcher("cartpay.jsp").forward(request,response);
			}
			
			
		}catch(Exception e){
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
