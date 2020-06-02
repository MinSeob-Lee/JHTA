<%@page import="com.simple.util.NumberUtil"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.dto.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int no = NumberUtil.stringToInt(request.getParameter("no"));
	BoardDao boardDao = new BoardDao();
	BoardDto board = boardDao.getBoardByNo(no);
	System.out.println(board.getNo());
	
	board.setDelYn("Y");
	boardDao.updateBoard(board);
	
	response.sendRedirect("list.jsp");
%>