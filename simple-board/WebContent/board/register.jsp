<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String) session.getAttribute("아이디");
	
	Board board = new Board();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);
	
	BoardDao boardDao = new BoardDao();
	boardDao.insertNewBoard(board);
	
	response.sendRedirect("list.jsp");
%>