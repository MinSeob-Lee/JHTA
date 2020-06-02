<%@page import="com.simple.util.StringUtil"%>
<%@page import="com.simple.vo.User"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = StringUtil.nullToBlank(request.getParameter("id"));
	String password = StringUtil.nullToBlank(request.getParameter("password"));
	
	UserDao userDao = new UserDao();
	User user = userDao.getUserById(id);
	
	if(user == null) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	if(!user.getPassword().equals(password)) {
		response.sendRedirect("loginform.jsp?error=fail");
		return;
	}
	
	session.setAttribute("이름", user.getName());
	session.setAttribute("아이디", user.getId());
	session.setAttribute("로그인여부", "Y");
	
	response.sendRedirect("/simple-board/home.jsp");
%>