<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = NumberUtil.stringToInt(request.getParameter("no"));
	
	BoardDao boardDao = new BoardDao();
	BoardDto board = boardDao.getBoardByNo(boardNo);
	
	board.setNo(boardNo);
	board.setHit(board.getHit() + 1);
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?no=" + boardNo);
%>