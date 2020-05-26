<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.vo.Board"%>
<%@page import="com.bookstore.dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bookstore</title>
<link rel="stylesheet" type="text/css" href="../css/bookstore.css">
<style type="text/css">
	label {
		font-weight: bold;
	}
	select {
		display: inline-block;
		width: 150px;
		height: 37px;
	}
	input {
		display: inline-block;
		width: 250px;
		height: 32px;
	}
	button {
		height: 37px;
	}
	
</style>
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%
			String position = "board";
			BoardDao boardDao = new BoardDao();
		%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 목록</h1>
	</div>
	<div class="body">
	<%
		String condition = StringUtil.nullToBlank(request.getParameter("searchCondition"));
		String keyword = StringUtil.nullToBlank(request.getParameter("searchKeyword"));
		
		List<Board> boards;
		if ("title".equals(condition)) {
			boards = boardDao.getAllBoardsByTitle(keyword);
		} else if ("writer".equals(condition)){
			boards = boardDao.getAllBoardsByWriter(keyword);
		} else if ("content".equals(condition)){
			boards = boardDao.getAllBoardsByContent(keyword);
		} else {
			boards = boardDao.getAllBoards();
		}
	%>
		<div>
			<p>게시글을 확인하세요</p>
			<table class="table">
				<thead>
					<tr>
						<th>글번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>등록일</th>
					</tr>				
				</thead>
				<tbody>
	<%
		for (Board board : boards) {
			if ("Y".equals(board.getDelYn())) {
	%>
					<tr>
						<td></td>
						<td style="text-decoration: line-through;" colspan="4">삭제된 글입니다.</td>
					</tr>
	<%
			} else {
	%>					
					<tr>
						<td><%=board.getNo() %></td>
						<td><a href="hit.jsp?boardno=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
						<td><%=board.getWriter() %></td>
						<td><%=board.getHit() %></td>
						<td><%=board.getRegisteredDate() %></td>
					</tr>
	<%
			}
		}
	%>
				</tbody>
			</table>
			<hr>
			<div class="text-right">
				<a href="form.jsp"><strong>[새글 등록하기]</strong></a>
			</div>
		</div>
		<div class="text-center">
			<form method="get" action="list.jsp">
				<label>검색조건</label>
				<select name="searchCondition" >
					<option value="title" <%="title".equals(condition) ? "selected" : "" %>> 제목</option>
					<option value="writer" <%="writer".equals(condition) ? "selected" : "" %>> 작성자</option>
					<option value="content" <%="content".equals(condition) ? "selected" : "" %>> 내용</option>
				</select>
				<input type="text" name="searchKeyword">
				<button type="submit">검색</button>
			</form>
		</div>	
	</div>
</div>
</body>
</html>