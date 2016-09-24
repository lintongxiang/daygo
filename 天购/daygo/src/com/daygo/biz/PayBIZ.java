package com.daygo.biz;

import com.daygo.dao.OrderDao;

public class PayBIZ {

	public boolean pay(int id){
		
		OrderDao dao=new OrderDao();
		boolean f=dao.updateOrderStatus(id, 2);
		return f;
	}
}
