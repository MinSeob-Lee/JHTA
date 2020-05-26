<%@page import="com.bookstore.dto.BoardDto"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	
	BoardDao boardDao = new BoardDao();
	
	BoardDto board = boardDao.getBoardByNo(boardNo);
	
	int hit = board.getHit();
	board.setHit(hit + 1);
	boardDao.updateBoard(board);
	
	response.sendRedirect("detail.jsp?boardno=" + boardNo);
%>