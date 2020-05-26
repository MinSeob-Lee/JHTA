<%@page import="com.bookstore.dao.LikeDao"%>
<%@page import="com.bookstore.vo.Like"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int bookNo = Integer.parseInt(request.getParameter("bookno"));
	String userId = request.getParameter("userid");
	
	Like like = new Like();
	like.setBookNo(bookNo);
	like.setUserId(userId);
	
	LikeDao likeDao = new LikeDao();
	likeDao.insertLike(like);
	
	response.sendRedirect("../book/detail.jsp?bookno=" + bookNo);
%>