package com.bookstore.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bookstore.dto.ReviewDto;
import com.bookstore.util.ConnectionUtil;
import com.bookstore.util.QueryUtil;

public class ReviewDao {

	public List<ReviewDto> getReviewByNo(int bookNo) throws SQLException {
		List<ReviewDto> reviews = new ArrayList<ReviewDto>();
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("review.getReviewByBookNo"));
		pstmt.setInt(1, bookNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			ReviewDto review = new ReviewDto();
			review.setUserName(rs.getString("USER_NAME"));
			review.setPoint(rs.getInt("REVIEW_POINT"));
			review.setRegisteredDate(rs.getDate("REVIEW_REGISTERED_DATE"));
			review.setContent(rs.getString("REVIEW_CONTENT"));
			
			reviews.add(review);
		}
		
		rs.close();
		pstmt.close();
		connection.close();
				
		return reviews;
	}
}
