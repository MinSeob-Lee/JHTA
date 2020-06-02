package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.BoardDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Board;

public class BoardDao {

	public List<Board> getBoardByWriter(String writer) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByWriter"));
		pstmt.setString(1, writer);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreatedDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public BoardDto getBoardByNo(int no) throws SQLException {
		BoardDto boardDto = new BoardDto();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setWriter(rs.getString("board_writer"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setHit(rs.getInt("board_hit"));
			boardDto.setReplyCnt(rs.getInt("board_reply_cnt"));
			boardDto.setDelYn(rs.getString("board_del_yn"));
			boardDto.setCreatedDate(rs.getDate("board_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boardDto;
	}
	
	
	public List<Board> getAllBoard() throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoard"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreatedDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public void insertNewBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.insertNewBoard"));
		
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(BoardDto board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setString(3, board.getWriter());
		pstmt.setInt(4, board.getHit());
		pstmt.setInt(5, board.getReplyCnt());
		pstmt.setString(6, board.getDelYn());
		pstmt.setInt(7, board.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();		
	}
	
	public int getBoardCount() throws SQLException {
		int rowCount = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardCount"));
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		rowCount = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return rowCount;
	}
	
	public List<Board> getBoardByRange(int beginNumber, int endNumber) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByRange"));
		pstmt.setInt(1, beginNumber);
		pstmt.setInt(2, endNumber);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setHit(rs.getInt("board_hit"));
			board.setReplyCnt(rs.getInt("board_reply_cnt"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setCreatedDate(rs.getDate("board_create_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
}
