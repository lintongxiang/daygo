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
import com.daygo.entity.Comment;
import com.daygo.entity.Goods;

/**
 * Servlet implementation class goodsServlet
 */
public class GoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodsServlet() {
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
		String id=request.getParameter("id");
		/*String id = "1";*/
		int g_id=-1;
		if(id!=null){
			g_id=Integer.parseInt(id);
		}
		if(g_id<=0){
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
		GoodsDao dao = new GoodsDao();
		Goods goods= new Goods();
		goods = dao.SelectGoods(g_id);
		request.setAttribute("goods",goods);
		if(goods==null){
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
		
		CommentDao dao1 = new CommentDao();
		List<Comment> list = dao1.queryAllComment();
		request.setAttribute("list",list);
		if(list==null){
			request.getRequestDispatcher("/error.jsp").forward(request, response);
			return;
		}
		
		request.setAttribute("goodsize", goods.getG_size().split(";"));
		request.getRequestDispatcher("/goods.jsp").forward(request, response);
	}

}
