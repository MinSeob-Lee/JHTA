<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@page import="com.simple.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String writer = (String) session.getAttribute("아이디");
	String content = request.getParameter("content");
	int boardNo = NumberUtil.stringToInt(request.getParameter("boardno"));
	
	Reply reply = new Reply();
	reply.setWriter(writer);
	reply.setContent(content);
	reply.setBoardNo(boardNo);
	
	BoardDao boardDao = new BoardDao();
	BoardDto board = boardDao.getBoardByNo(boardNo);
	
	board.setReplyCnt(board.getReplyCnt() + 1);
	boardDao.updateBoard(board);
	
	ReplyDao replyDao = new ReplyDao();
	replyDao.insertReply(reply);
	
	response.sendRedirect("../board/detail.jsp?no=" + boardNo);	
%>