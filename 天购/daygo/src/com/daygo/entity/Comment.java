package com.daygo.entity;

import java.util.Date;

public class Comment {
	private int c_id;
	private int c_rank;
	private String c_context;
	private Date c_time;
	private int u_id;

	public Comment(int cRank, String cContent, Date cTime) {
		c_rank = cRank;
		c_context = cContent;
		c_time = cTime;

	}
	@Override
	public String toString() {
		return "Comment [c_context=" + c_context + ", c_id=" + c_id
				+ ", c_rank=" + c_rank + ", c_time=" + c_time + ""
				+ "]";
	}
	public Comment() {
	}
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int cId) {
		c_id = cId;
	}
	public int getC_rank() {
		return c_rank;
	}
	public void setC_rank(int cRank) {
		c_rank = cRank;
	}
	public String getC_context() {
		return c_context;
	}
	public void setC_context(String cContext) {
		c_context = cContext;
	}
	public Date getC_time() {
		return c_time;
	}
	public void setC_time(Date cTime) {
		c_time = cTime;
	}
	public void setU_id(int uId) {
		u_id=uId;
	}
	public int getU_id(){
		return u_id;
	}
	
}
