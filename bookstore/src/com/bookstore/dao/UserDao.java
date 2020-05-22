package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;
import com.bookstore.vo.User;

public class UserDao {

	public List<User> getNewUsers() throws SQLException {
		List<User> users = new ArrayList<User>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("user.getNewUsers"));
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			User user = new User();
			user.setName(rs.getString("user_name"));
			user.setId(rs.getString("user_id"));
			user.setEmail(rs.getString("user_email"));
			user.setRegeisteredDate(rs.getDate("user_registered_date"));
			
			users.add(user);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return users;
	}
}
