<%@page import="com.simple.util.NumberUtil"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String writer = (String) session.getAttribute("아이디");
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	
	BoardDto board = new BoardDto();
	board.setTitle(title);
	board.setContent(content);
	board.setWriter(writer);
	board.setNo(boardNo);
	
	BoardDao boardDao = new BoardDao();
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>