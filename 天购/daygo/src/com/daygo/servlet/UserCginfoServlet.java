package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.daygo.biz.UserBiz;
import com.daygo.biz.UserCenterBIZ;
import com.daygo.dao.UserDao;
import com.daygo.entity.User;
import com.daygo.util.Fuction;

public class UserCginfoServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UserCginfoServlet() {
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
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		HttpSession session=request.getSession();
		String username=(String)session.getAttribute("username");
		if (action == null) {
			action = "index";
		}
		if (action.equals("index")) {
			request.getRequestDispatcher("usercenter.jsp").forward(request,
					response);
		} else if (action.equals("changeinfo")) {
			Fuction fuc = new Fuction();
			UserCenterBIZ usercenterbiz = new UserCenterBIZ();
			User user = usercenterbiz.getinfoByName(username);
			String tel = request.getParameter("extend_field5");
			String mail = request.getParameter("email");
			String problem = fuc.chackproblem(request
					.getParameter("sel_question"));
			String answer = request.getParameter("passwd_answer");
			int sex = Integer.parseInt(request.getParameter("sex"));
			if (fuc.chackmail(mail) && fuc.chacktel(tel)) {
				user.setU_answer(answer);
				user.setU_mail(mail);
				user.setU_problem(problem);
				user.setU_sex(sex);
				user.setU_tel(tel);
				UserDao userdao = new UserDao();
				userdao.Updateinfo(user);
				request.setAttribute("user", user);
				request.getRequestDispatcher("usercenter_info.jsp").forward(
						request, response);
			} else {
				request.setAttribute("msg", "�������ϵ�绰�����������������");
				request.getRequestDispatcher("usercenter_info.jsp").forward(
						request, response);
			}
		} else {
			if (action.equals("changepwd")) {
				UserCenterBIZ usercenterbiz = new UserCenterBIZ();
				User user = usercenterbiz.getinfoByName(username);
				String oldpwd = request.getParameter("old_password");
				String newpwd1 = request.getParameter("new_password");
				String newpwd2 = request.getParameter("comfirm_password");
				UserBiz userbiz=new UserBiz();
				String msg=userbiz.changepwd(username, oldpwd, newpwd1, newpwd2);
				request.setAttribute("msg", msg);
				request.getRequestDispatcher("usercenter_info.jsp")
						.forward(request, response);
			}
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
