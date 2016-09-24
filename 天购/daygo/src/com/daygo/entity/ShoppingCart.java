package com.daygo.entity;

public class ShoppingCart {
	private int s_id;
	private int g_id;
	private String g_size;
	private int s_number;
	public String getG_size() {
		return g_size;
	}

	public void setG_size(String g_size) {
		this.g_size = g_size;
	}


	
	public ShoppingCart(){
	}
	
	public ShoppingCart(int s_id,int g_id,String g_size, int s_number){
		this.g_id=g_id;
		this.s_id=s_id;
		this.g_size=g_size;
		
		this.s_number=s_number;
	}
	
	public int getS_id() {
		return s_id;
	}
	public void setS_id(int sId) {
		s_id = sId;
	}
	public int getG_id() {
		return g_id;
	}
	public void setG_id(int gId) {
		g_id = gId;
	}
	public int getS_number(){
		return s_number;
	}
	public void setS_number(int sNumber){
		s_number=sNumber;
	}

	@Override
	public String toString() {
		return "ShoppingCart [s_id=" + s_id + ", g_id=" + g_id + ", g_size="
				+ g_size + ", s_number=" + s_number + "]";
	}


}
