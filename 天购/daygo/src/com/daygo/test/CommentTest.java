package com.daygo.test;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;

import com.daygo.dao.CommentDao;
import com.daygo.entity.Comment;




public class CommentTest {
	
	@org.junit.Test
	public void add(){
		CommentDao dao = new CommentDao();
		Comment comment = new Comment(333,"#3333",new Date(0));
		dao.addComment(comment);
	}
	@org.junit.Test
	public void delete(){
		CommentDao dao = new CommentDao();
		dao.deleteComment(3);
	}
	@org.junit.Test
	public void update(){
		CommentDao dao = new CommentDao();
		Comment comment = new Comment(333,"#3333",new Date(0));
		comment.setC_id(1);
		dao.updateComment(comment);
	}
	@org.junit.Test
	public void queryall() throws SQLException{
		CommentDao dao = new CommentDao();
		ArrayList<Comment> list = (ArrayList<Comment>) dao.queryAllComment();
		for (Comment comment : list) {
			System.out.println(comment);

		}
	}

		@org.junit.Test
		public void querybyattrid() throws SQLException{
			CommentDao dao = new CommentDao();
			ArrayList<Comment> list = (ArrayList<Comment>) dao.queryByAttrId("g_id",2);
			for (Comment comment : list) {
				System.out.println(comment);

			}

	}
}
