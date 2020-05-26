package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.BoardDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.Board;

public class BoardDao {

	public List<Board> getAllBoards() throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoards"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getAllBoardsByTitle(String title) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoardsByTitle"));
		pstmt.setString(1, title);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getAllBoardsByWriter(String writer) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoardsByWriter"));
		pstmt.setString(1, writer);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public List<Board> getAllBoardsByContent(String content) throws SQLException {
		List<Board> boards = new ArrayList<Board>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getAllBoardsByContent"));
		pstmt.setString(1, content);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			Board board = new Board();
			board.setNo(rs.getInt("board_no"));
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
			
			boards.add(board);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public void insertBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.insertBoard"));
		
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		pstmt.setInt(4, board.getPassword());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public BoardDto getBoardByNo(int no) throws SQLException {
		BoardDto board = new BoardDto();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByNo"));
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			board.setTitle(rs.getString("board_title"));
			board.setWriter(rs.getString("board_writer"));
			board.setContent(rs.getString("board_content"));
			board.setPassword(rs.getInt("board_password"));
			board.setHit(rs.getInt("board_hit"));
			board.setNo(rs.getInt("board_no"));
			board.setDelYn(rs.getString("board_del_yn"));
			board.setRegisteredDate(rs.getDate("board_registered_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return board;
	}
	
	public void updateBoard(BoardDto board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		pstmt.setInt(4, board.getPassword());
		pstmt.setInt(5, board.getHit());
		pstmt.setString(6, board.getDelYn());
		pstmt.setDate(7, board.getRegisteredDate());
		pstmt.setInt(8, board.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();		
	}
}
