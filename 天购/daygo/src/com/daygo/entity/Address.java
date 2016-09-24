package com.daygo.entity;

public class Address {
	private int a_id;
	private String a_tel;
	private String a_add;
	private String a_name;
	private String a_phone;
	private String a_num;
	private String a_mail;
	private int u_id;
	public Address(String aTel, String aAdd, String aName, int uId,String aPhone,String aMail,String aNum) {
		a_tel = aTel;
		a_add = aAdd;
		a_name = aName;
		u_id = uId;
		a_phone = aPhone;
		a_num = aNum;
		a_mail = aMail;
	}
	public Address() {
		
	}
	public String getA_phone() {
		return a_phone;
	}
	public void setA_phone(String a_phone) {
		this.a_phone = a_phone;
	}
	public String getA_num() {
		return a_num;
	}
	public void setA_num(String a_num) {
		this.a_num = a_num;
	}
	public String getA_mail() {
		return a_mail;
	}
	public void setA_mail(String a_mail) {
		this.a_mail = a_mail;
	}
	public int getA_id() {
		return a_id;
	}
	public void setA_id(int aId) {
		a_id = aId;
	}
	public String getA_tel() {
		return a_tel;
	}
	public void setA_tel(String aTel) {
		a_tel = aTel;
	}
	public String getA_add() {
		return a_add;
	}
	public void setA_add(String aAdd) {
		a_add = aAdd;
	}
	public String getA_name() {
		return a_name;
	}
	public void setA_name(String aName) {
		a_name = aName;
	}
	public int getU_id() {
		return u_id;
	}
	public void setU_id(int uId) {
		u_id = uId;
	}
	@Override
	public String toString() {
		return "Address [a_add=" + a_add + ", a_id=" + a_id + ", a_name="
				+ a_name + ", a_tel=" + a_tel + ", u_id=" + u_id + ",a_phone="
						+ ""+a_phone+", a_mail=" + a_mail + ", a_num=" + a_num + "]";
	}
	
}
