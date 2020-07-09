package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.TodoDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;

// 가장 최근 일정 6개를 조회하기
// todo.getRecentTodos=
public class TodoDao {

	private static TodoDao self = new TodoDao();	// 정적변수 self에 TodoDao객체를 담아둔다.
	private TodoDao() {}							// 생성자의 외부 접근을 차단한다.
	public static TodoDao getInstance() {			// 미리 생성된 TodoDao객체를 제공하는 기능이다.
		return self;
	}
	
	public List<TodoDto> getRecentTodos() throws SQLException {
		List<TodoDto> todos = new ArrayList<TodoDto>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getRecentTodos"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			TodoDto todo = new TodoDto();
			todo.setNo(rs.getInt("todo_no"));
			todo.setTitle(rs.getString("todo_title"));
			todo.setContent(rs.getString("todo_content"));
			todo.setDay(rs.getDate("todo_day"));
			todo.setCompletedDay(rs.getDate("todo_completed_day"));
			todo.setStatus(rs.getString("todo_status"));
			todo.setUserId(rs.getString("user_id"));
			todo.setCreateDate(rs.getDate("todo_created_date"));
			todo.setUserName(rs.getString("user_name"));
			
			todos.add(todo);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todos;
	}
	
	public TodoDto getTodoByNo(int todoNo) throws SQLException {
		TodoDto todo = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoByNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			todo = new TodoDto();
			todo.setNo(rs.getInt("todo_no"));
			todo.setTitle(rs.getString("todo_title"));
			todo.setContent(rs.getString("todo_content"));
			todo.setDay(rs.getDate("todo_day"));
			todo.setCompletedDay(rs.getDate("todo_completed_day"));
			todo.setStatus(rs.getString("todo_status"));
			todo.setUserId(rs.getString("user_id"));
			todo.setCreateDate(rs.getDate("todo_created_date"));
			todo.setUserName(rs.getString("user_name"));
		}

		rs.close();
		pstmt.close();
		connection.close();
		
		return todo;
	}
	
	public void updateTodo(TodoDto todoDto) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.updateTodo"));
		
		pstmt.setString(1, todoDto.getTitle());
		pstmt.setString(2, todoDto.getContent());
		pstmt.setString(3, todoDto.getStatus());
		pstmt.setDate(4, new java.sql.Date(todoDto.getDay().getTime()));
		pstmt.setDate(5, todoDto.getCompletedDay() != null ? new java.sql.Date(todoDto.getCompletedDay().getTime()) : null);
		pstmt.setInt(6, todoDto.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public int getTotalRows(String userId, String status, String keyword) throws SQLException {
		String sql = "select count(*) ";
			   sql += "from sample_todos ";
			   sql += "where user_id = '"+userId+"' ";
		if (!"전체".equals(status)) {
			 sql += "and todo_status = '"+status+"' ";
		}
		if (!keyword.isEmpty()) {
			sql += "and todo_title_like '%' || '"+keyword+"' || '%' ";
		}
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		int totalRows = rs.getInt(1);
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalRows;
	}
	
	public List<TodoDto> getTodos(String userId, String status, String keyword, int beginIndex, int endIndex) throws SQLException {
		
		String sql = "select * ";
		sql += "from (select A.*, row_number() over (order by todo_no desc) rn ";
		sql += "      from sample_todos A ";
		sql += "	  where user_id = '"+userId+"' ";
		if (!"전체".equals(status)) {
			 sql += "and todo_status = '"+status+"' ";
		}
		if (!keyword.isEmpty()) {
			sql += "and todo_title_like '%' || '"+keyword+"' || '%' ";
		}
		sql += " ) where rn >= ? and rn <= ? ";
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1, beginIndex);
		pstmt.setInt(2, endIndex);
		
		ResultSet rs = pstmt.executeQuery();
		List<TodoDto> todoDtoList = new ArrayList<TodoDto>();
		
		while(rs.next()) {
			TodoDto todo = new TodoDto();
			todo.setNo(rs.getInt("todo_no"));
			todo.setTitle(rs.getString("todo_title"));
			todo.setDay(rs.getDate("todo_day"));
			todo.setStatus(rs.getString("todo_status"));
			
			todoDtoList.add(todo);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todoDtoList;
	}
}
