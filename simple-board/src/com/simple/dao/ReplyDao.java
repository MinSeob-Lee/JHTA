package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Reply;

public class ReplyDao {

	public List<Reply> getReplyByWriter(String writer) throws SQLException {
		List<Reply> replys = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplyByWriter"));
		pstmt.setString(1, writer);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYn(rs.getString("reply_del_yn"));
			reply.setCreatedDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
	
	public List<Reply> getReplyByBoardNo(int boardNo) throws SQLException {
		List<Reply> replys = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getReplyByBoardNo"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(boardNo);
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYn(rs.getString("reply_del_yn"));
			reply.setCreatedDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
	
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
	
	public List<Reply> getAllReply() throws SQLException {
		List<Reply> replys = new ArrayList<Reply>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("reply.getAllReply"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Reply reply = new Reply();
			reply.setNo(rs.getInt("reply_no"));
			reply.setWriter(rs.getString("reply_writer"));
			reply.setContent(rs.getString("reply_content"));
			reply.setDelYn(rs.getString("reply_del_yn"));
			reply.setCreatedDate(rs.getDate("reply_create_date"));
			reply.setBoardNo(rs.getInt("board_no"));
			
			replys.add(reply);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return replys;
	}
}
