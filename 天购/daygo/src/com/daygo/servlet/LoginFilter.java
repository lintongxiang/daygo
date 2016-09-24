package com.daygo.servlet;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	private FilterConfig config;
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		String[] cnf=config.getInitParameter("noFilterPaths").split(";");
		for(int i=0;i<cnf.length;i++){
			
			if(((HttpServletRequest)request).getRequestURL().indexOf(cnf[i])!=-1 ||
					((HttpServletRequest)request).getRequestURI().equals("/daygo")||
					((HttpServletRequest)request).getRequestURI().equals("/daygo/")){
				chain.doFilter(request, response);
				return;
			}
		}
		String username=(String) ((HttpServletRequest)request).getSession().getAttribute("username");
		if(username!=null&&!"".equals(username)){
			chain.doFilter(request, response);
		}else{
			request.getRequestDispatcher("Login.html").forward(request, response);
		}
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		this.config=config;
	}

}
