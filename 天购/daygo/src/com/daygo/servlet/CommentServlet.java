package com.daygo.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daygo.dao.CommentDao;
import com.daygo.dao.GoodsDao;
import com.daygo.dao.UserDao;
import com.daygo.entity.Comment;
import com.daygo.entity.Goods;

/**
 * Servlet implementation class goodsServlet
 */
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=(String)request.getSession().getAttribute("username");
		CommentDao dao1 = new CommentDao();
		List<Comment> list = dao1.queryAllComment();
		request.setAttribute("list",list);
		UserDao dao=new UserDao();
		int u_id=dao.getuserByname(username).getU_id();
		request.setAttribute("u_id",u_id);
		if(list==null){
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
		request.getRequestDispatcher("/usercenter_comment.jsp").forward(request, response);
	}

}
