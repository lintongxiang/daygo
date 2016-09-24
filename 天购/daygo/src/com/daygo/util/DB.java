package com.daygo.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class DB {

	public static final String PREFIX="dg_";
	private Connection conn;
	private PreparedStatement statement;
	private ResultSet res;
	private Statement state;
	
	public DB() {
		try{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(
				"jdbc:mysql://localhost/daygo?useUnicode=true&characterEncoding=UTF-8", "root", "123456");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public DB prepareStatement(String sql) {
		try{
		statement = conn.prepareStatement(sql);
		return this;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return this;
	}
	public DB setInt(int index,int x) {
		try{
		statement.setInt(index, x);
		return this;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return this;
	}
	
	public DB setString(int index,String x){
		try{
		statement.setString(index, x);
		return this;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return this;
	}
	public DB setDouble(int index,double x)
	{
		try{
			statement.setDouble(index, x);
			return this;
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return this;
	}
	public DB set(int index,Date date){
		try{
		statement.setTimestamp(index, new java.sql.Timestamp(date.getTime()));
		return this;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return this;
	}
	
	public ResultSet p_query() {
		try{
		res=statement.executeQuery();
		return res;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	
	public boolean p_execute(){
		try{
		boolean b=statement.execute();
		
		return b;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public ResultSet query(String sql) {
		try{
		state=conn.createStatement();
		res=state.executeQuery(sql);
		return res;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}

	public boolean  execute(String sql){
		try{
		state=conn.createStatement();
		boolean res=state.execute(sql);
		return res;
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}
	
	public void close(){
		try{
		if(res!=null){
			res.close();
		}
		if(state!=null){
			state.close();
		}
		if(statement!=null){
			statement.close();
		}
		if(conn!=null){
			conn.close();
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public DB prepareStatementw(String sql, int returnGeneratedKeys) {
		try{
			statement = conn.prepareStatement(sql,returnGeneratedKeys);
			return this;
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return this;
	}
	

	public ResultSet getGeneratedKeys(){
		try {
			return statement.getGeneratedKeys();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
