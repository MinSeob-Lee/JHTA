<%@page import="com.bookstore.dao.ReviewDao"%>
<%@page import="com.bookstore.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String content = request.getParameter("content");
	int point = Integer.parseInt(request.getParameter("point"));
	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	String userId = request.getParameter("userid");
	
	Review review = new Review();
	review.setContent(content);
	review.setPoint(point);
	review.setBookNo(bookNo);
	review.setUserId(userId);
	
	ReviewDao reviewDao = new ReviewDao();
	reviewDao.insertReview(review);
	
	response.sendRedirect("../book/detail.jsp?bookno=" + bookNo);
%>