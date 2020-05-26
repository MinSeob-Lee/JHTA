<%@page import="com.bookstore.dto.BoardDto"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	int password = NumberUtil.stringToInt(request.getParameter("password"));
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	BoardDao boardDao = new BoardDao();
	
	BoardDto board = boardDao.getBoardByNo(boardNo);
	
	 if(board.getPassword() == password) {
		board.setDelYn("Y");	
		boardDao.updateBoard(board);	
		
		response.sendRedirect("list.jsp");
	} else {
		response.sendRedirect("deleteform.jsp?boardno=" + boardNo + "&err=password");
	}	
%>