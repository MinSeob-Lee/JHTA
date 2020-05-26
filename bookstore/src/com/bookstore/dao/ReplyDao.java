package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Reply;

public class ReplyDao {

	public void insertReply(Reply reply) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.insertReply"));
		
		pstmt.setString(1, reply.getWriter());
		pstmt.setString(2, reply.getContent());
		pstmt.setInt(3, reply.getBoardNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<Reply> getReplysByBoardNo(int boardNo) throws SQLException {
		List<Reply> replys = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplysByBoardNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setRegisteredDate(rs.getDate("reply_registered_date"));
			
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
}
