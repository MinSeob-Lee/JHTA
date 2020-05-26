<%@page import="com.bookstore.dto.BoardDto"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.vo.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	int password = NumberUtil.stringToInt(request.getParameter("password"));
	String content = request.getParameter("content");
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	BoardDao boardDao = new BoardDao();
	
	BoardDto board = boardDao.getBoardByNo(boardNo);
	
	 if(board.getPassword() == password) {
		board.setTitle(title);
		board.setPassword(password);
		board.setContent(content);
		board.setNo(boardNo);
	
		boardDao.updateBoard(board);	
		
		response.sendRedirect("detail.jsp?no=" + boardNo);
	} else {
		response.sendRedirect("modifyform.jsp?boardno=" + boardNo + "&err=password");
	}	
%>