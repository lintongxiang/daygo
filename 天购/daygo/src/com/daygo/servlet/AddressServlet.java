package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daygo.biz.AddressBiz;
import com.daygo.biz.UserCenterBIZ;
import com.daygo.dao.UserDao;
import com.daygo.entity.Address;
import com.daygo.entity.User;

public class AddressServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddressServlet() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String action = request.getParameter("action");
		HttpSession session=request.getSession();
		String username=(String)session.getAttribute("username");
		UserDao userdao=new UserDao();
		User user=userdao.getuserByname(username);
		if (action == null) {
			action = "index";
		}
		if (action.equals("index")) {
			request.getRequestDispatcher("usercenter.jsp").forward(request,
					response);
		} else {
			if (action.equals("update")) {
				int a_id = Integer.parseInt(request.getParameter("flag"));
				String a_tel = request.getParameter("tel");
				String a_add = request.getParameter("address");
				String a_name = request.getParameter("consignee");
				int u_id = user.getU_id();
				String a_num=request.getParameter("zipcode");
				String a_mail=request.getParameter("email");
				String a_phone=request.getParameter("mobile");
				Address address=new Address(a_tel, a_add, a_name, u_id,a_phone,a_mail,a_num);
				address.setA_id(a_id);
				AddressBiz addressbiz=new AddressBiz();
				addressbiz.updateaddress(address);
			} else {
				if (action.equals("insert")) {
					String a_tel = request.getParameter("tel");
					String a_add = request.getParameter("address");
					String a_name = request.getParameter("consignee");
					int u_id = user.getU_id();
					String a_num=request.getParameter("zipcode");
					String a_mail=request.getParameter("email");
					String a_phone=request.getParameter("mobile");
					Address address=new Address(a_tel, a_add, a_name, u_id,a_phone,a_mail,a_num);
					AddressBiz addressbiz=new AddressBiz();
					addressbiz.insertaddress(address);
				}
				else
				{
					if(action.equals("delete"))
					{
						AddressBiz addressbiz=new AddressBiz();
						addressbiz.deleteaddress(Integer.parseInt(request.getParameter("aid")));
					}
				}
			}
			UserCenterBIZ usercenterbiz=new UserCenterBIZ();
			List<Address> list=new ArrayList();
			list=usercenterbiz.getAddressByName(username);
			request.setAttribute("addresslist", list);
			request.getRequestDispatcher("usercenter_address.jsp").forward(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
