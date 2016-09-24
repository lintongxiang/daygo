package com.daygo.entity;

import java.sql.Date;
import java.sql.SQLException;

public class Order {

	private int o_id;
	private int o_status;
	private Date o_time;
	private double o_totalprice;
	
	public Order(){
		
	}
	
	public double getO_totalprice() {
		return o_totalprice;
	}

	public void setO_totalprice(double o_totalprice) {
		this.o_totalprice = o_totalprice;
	}

	public Order(int oId, int oStatus, Date oTime) {
		super();
		o_id = oId;
		o_status = oStatus;
		o_time = oTime;
	}
	public int getO_id() {
		return o_id;
	}
	public void setO_id(int oId) {
		o_id = oId;
	}
	public int getO_status() {
		return o_status;
	}
	public void setO_status(int oStatus) {
		o_status = oStatus;
	}
	public Date getO_time() {
		return o_time;
	}
	public void setO_time(Date oTime) {
		o_time = oTime;
	}

	@Override
	public String toString() {
		return "Order [o_id=" + o_id + ", o_status=" + o_status + ", o_time="
				+ o_time + "]";
	}
	
	
}
