package com.sample.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sample.util.ConnectionUtil;
import com.smaple.vo.Book;
import com.smaple.vo.User;

public class UserDao {

	public void AddUser(User user) throws SQLException {
		String sql = "insert into sample_book_users " 
					+ "(user_id, user_password, user_name, " 
					+ "user_email) " 
					+ "values " 
					+ "(?, ?, ?, ?)";

		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);

		pstmt.setString(1, user.getUserId());
		pstmt.setString(2, user.getPassword());
		pstmt.setString(3, user.getName());
		pstmt.setString(4, user.getEmail());

		pstmt.executeUpdate();

		pstmt.close();
		connection.close();
	}
	
	public List<User> getAllUsers() throws Exception {
		String sql = "select * "
					+ "from sample_book_users "
					+ "order by user_id desc ";
		
		List<User> users = new ArrayList<User>();
		
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			user.setUserId(rs.getString("user_id"));
			user.setPassword(rs.getString("user_password"));
			user.setName(rs.getString("user_name"));
			user.setEmail(rs.getString("user_email"));
			user.setPoint(rs.getInt("user_point"));
			user.setRegisteredDate(rs.getDate("user_registered_date"));
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
}
