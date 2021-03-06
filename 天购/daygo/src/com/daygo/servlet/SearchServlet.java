package com.daygo.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.daygo.dao.GoodsDao;
import com.daygo.entity.Goods;

public class SearchServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SearchServlet() {
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

		String category=request.getParameter("category");
		String key=request.getParameter("key");
		if(key!=null)
		key=new String(key.getBytes("ISO-8859-1"),"utf-8");
		GoodsDao goodsdao=new GoodsDao();
		ArrayList<Goods> list=new ArrayList<Goods>();
		if(category!=null){
			category=new String(category.getBytes("ISO-8859-1"),"utf-8");
			if(key!=null){
				list=goodsdao.getGoodsByCatoryAndKey(category, key);
			}else{
				list=goodsdao.getGoodsByCatory(category);
			}
		}else{
			list=(ArrayList<Goods>) goodsdao.GetGoodsByKey(key);
		}
		request.setAttribute("list", list);
		request.setAttribute("count", list.size());
		request.getRequestDispatcher("/search.jsp").forward(request, response);
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
