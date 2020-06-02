<%@page import="java.util.List"%>
<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	
	User user = new User();
	user.setId(id);
	user.setName(name);
	user.setPassword(password);
	user.setEmail(email);
	
	UserDao userDao = new UserDao();
	User userid = userDao.getUserById(id);

	if(userid.getId() != null) {
		response.sendRedirect("form.jsp?error=fail");
		return;
	}
	
	userDao.registerUser(user);
	
	response.sendRedirect("../home.jsp");	
%>