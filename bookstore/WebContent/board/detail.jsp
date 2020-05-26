<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.dto.BoardDto"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
</head>
<body>
	<div class="wrapper">
		<% 
			String position = "board";
		%>
		<div class="navi">		
			<%@ include file="../common/navibar.jsp" %>
		</div>
		<div class="header">
			<h1>게시글 상세보기</h1>
		</div>
		<div class="body">
		<%
			int no = Integer.parseInt(request.getParameter("no"));
			BoardDao boardDao = new BoardDao();
			BoardDto board = boardDao.getBoardByNo(no);
		%>
			<div>
				<table class="table">
					<tr>
					<th>제목</th>
					<td colspan="3"><%=board.getTitle() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=board.getWriter() %></td>
					<th>조회수</th>
					<td><%=board.getHit() %></td>
				</tr>
				<tr>
					<th>삭제여부</th>
					<td><%=board.getDelYn() %></td>
					<th>작성일자</th>
					<td><%=board.getRegisteredDate() %></td>
				</tr>
				<tr>
					<th>작성내용</th>
					<td colspan="6"><%=StringUtil.strWithBr(board.getContent()) %></td>
				</tr>
				</table>
			</div>
			<div class="form-group">
			<h3>댓글 작성</h3>
				<table class="table">
					<tr>
						<td><input type="text" name="writer" placeholder="닉네임"/></td>		
						<td><input type="password" name="password" maxlength="4" placeholder="비밀번호"/></td>
					</tr>
					<tr>
						<td><textarea rows="6" name="content" placeholder="내용을 입력해주세요."></textarea></td>
					</tr>
				</table>
			</div>
				<div class="text-right">
					<button type="submit">등록</button>
				</div>
		</div>
	</div>
</body>
</html>