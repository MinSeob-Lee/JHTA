package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.User;

public class UserDao {

	public void registerUser(User user) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.registerUser"));
		
		pstmt.setString(1, user.getId());
		pstmt.setString(2, user.getName());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getEmail());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public User getUserById(String id) throws SQLException {
		User user = new User();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getUserById"));
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			user.setId(rs.getString("user_id"));
			user.setName(rs.getString("user_name"));
			user.setPassword(rs.getString("user_password"));
			user.setEmail(rs.getString("user_email"));
			user.setDisabled(rs.getString("user_disabled"));
			user.setCreatedDate(rs.getDate("user_create_date"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return user;
	}
}
