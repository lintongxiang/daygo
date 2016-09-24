package com.daygo.entity;
import java.sql.Date;
import java.sql.Timestamp;


public class User {
private int u_id;
private String u_name;
private String u_pwd;
private String u_salt;
private String u_problem;
private int u_sex;
private String u_answer;
private String u_tel;
private String u_mail;
private Timestamp u_lasttime;
private String u_lastip;
private int u_sid;
public User()
{}
public int getU_id() {
	return u_id;
}
public void setU_id(int uId) {
	u_id = uId;
}
public String getU_name() {
	return u_name;
}
public void setU_name(String uName) {
	u_name = uName;
}
public String getU_pwd() {
	return u_pwd;
}
public void setU_pwd(String uPwd) {
	u_pwd = uPwd;
}
public String getU_salt() {
	return u_salt;
}
public void setU_salt(String uSalt) {
	u_salt = uSalt;
}
public String getU_problem() {
	return u_problem;
}
public void setU_problem(String uProblem) {
	u_problem = uProblem;
}
public int getU_sex() {
	return u_sex;
}
public void setU_sex(int uSex) {
	u_sex = uSex;
}
public String getU_answer() {
	return u_answer;
}
public void setU_answer(String uAnswer) {
	u_answer = uAnswer;
}
public String getU_tel() {
	return u_tel;
}
public void setU_tel(String uTel) {
	u_tel = uTel;
}
public String getU_mail() {
	return u_mail;
}
public void setU_mail(String uMail) {
	u_mail = uMail;
}
public Timestamp getU_lasttime() {
	return u_lasttime;
}
public void setU_lasttime(Timestamp uLasttime) {
	u_lasttime = uLasttime;
}
public String getU_lastip() {
	return u_lastip;
}
public void setU_lastip(String uLastip) {
	u_lastip = uLastip;
}
public int getU_sid() {
	return u_sid;
}
public void setU_sid(int uSid) {
	u_sid = uSid;
}

}
