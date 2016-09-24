package com.daygo.entity;

public class Goods {
private int g_id;
private String g_describe;
private String g_category;
private String g_size;
private String g_name;
private int g_number;
private double g_price;
private String g_picture;
private int u_id;
public int getU_id() {
	return u_id;
}
public void setU_id(int u_id) {
	this.u_id = u_id;
}
public Goods()
{}
public int getG_id() {
	return g_id;
}
public void setG_id(int gId) {
	g_id = gId;
}
public String getG_describe() {
	return g_describe;
}
public void setG_describe(String gDescribe) {
	g_describe = gDescribe;
}
public String getG_category() {
	return g_category;
}
public void setG_category(String gCaregory) {
	g_category = gCaregory;
}
public String getG_size() {
	return g_size;
}
public void setG_size(String gSize) {
	g_size = gSize;
}
public String getG_name() {
	return g_name;
}
public void setG_name(String gName) {
	g_name = gName;
}
public int getG_number() {
	return g_number;
}
public void setG_number(int number) {
	this.g_number = number;
}
public double getG_price() {
	return g_price;
}
public void setG_price(double gPrice) {
	g_price = gPrice;
}
public String getG_picture() {
	return g_picture;
}
public void setG_picture(String gPicture) {
	g_picture = gPicture;
}
}
