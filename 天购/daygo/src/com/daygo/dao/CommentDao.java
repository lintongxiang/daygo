package com.daygo.dao;



import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.daygo.entity.Comment;
import com.daygo.util.DB;

public class CommentDao {
	public void addComment(Comment Comment){
		DB db = new DB();
		String sql = "insert into dg_Comment(u_id,c_rank,c_context,c_time) value(?,?,?,? )";
		db.prepareStatement(sql);
		
		db.setInt(1, Comment.getU_id());
		db.setInt(2, Comment.getC_rank());
		db.setString(3,Comment.getC_context());
		db.set(4, Comment.getC_time());

		db.p_execute();
		db.close();
	
	}
	public void deleteComment(int id){
		DB db = new DB();
		String sql = "delete from dg_Comment where c_id = ?";
		db.prepareStatement(sql);
		db.setInt(1, id);
		db.p_execute();
	}
	public void updateComment(Comment comment){
		DB db = new DB();
		String sql = "update dg_Comment set u_id=?,c_rank=?,c_context=?,c_time=? where c_id = ?";
		db.prepareStatement(sql);
		db.setInt(1, comment.getU_id());
		db.setInt(2, comment.getC_rank());
		db.setString(3,comment.getC_context());
		db.set(4, comment.getC_time());
		db.setInt(5, comment.getC_id());
		db.p_execute();
		db.close();
	}
	public List<Comment> queryAllComment(){
		DB db = new DB();
		String sql = "select * from dg_Comment;";
		ResultSet resultSet = db.query(sql);
		ArrayList<Comment> list = new ArrayList();
		try {
		while (resultSet.next()) {
			
			int u_id = resultSet.getInt("u_id");
			int c_id = resultSet.getInt("c_id");
			int c_rank = resultSet.getInt("c_rank");
			String c_context = resultSet.getString("c_context");
			Date c_time = resultSet.getDate("c_time");

			Comment comment = new Comment();
			comment.setU_id(u_id);
			comment.setC_id(c_id);
			comment.setC_rank(c_rank);
			comment.setC_context(c_context);
			comment.setC_time(c_time);
			list.add(comment);
			
		}
		db.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
	
	public List<Comment> queryByAttrId(String attrIdname,int id) throws SQLException{
		DB db = new DB();
		String sql = "select * from dg_Comment where c_id in (SELECT c_id FROM dg_rel_user_comment_goods WHERE 1=1";
		if(sql!=null){
			sql = sql.concat(" and "+attrIdname+" = "+id+")");
		}
		db.prepareStatement(sql);
		ResultSet resultSet = (ResultSet) db.p_query();
		ArrayList<Comment> list = new ArrayList<Comment>();
		while(resultSet.next()) {
			
			int u_id = resultSet.getInt("u_id");
			int c_id = resultSet.getInt("c_id");
			int c_rank = resultSet.getInt("c_rank");
			String c_context = resultSet.getString("c_context");
			Date c_time = resultSet.getDate("c_time");


			Comment comment = new Comment();
			comment.setU_id(u_id);
			comment.setC_id(c_id);
			comment.setC_rank(c_rank);
			comment.setC_context(c_context);
			comment.setC_time(c_time);

		

			list.add(comment);
			
			
		}
		db.close();
		return list;

	}
}
