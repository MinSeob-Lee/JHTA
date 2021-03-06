<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.util.NumberUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css" />
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 수정</h1>
	</div>
	<div class="body">
	<%
		int no = NumberUtil.stringToInt(request.getParameter("no"));
		BoardDao boardDao = new BoardDao();
		BoardDto board = boardDao.getBoardByNo(no);
	%>
		<p>수정 요소를 입력해주세요.</p>
		<div class="well">
			<form method="post" action="modify.jsp">
			<input type="hidden" name="boardno" value="<%=no %>" />
				<div class="form-group">
					<label>제목</label>
						<div><input type="text" name="title" value="<%=board.getTitle() %>"/></div>
				</div>
				<div class="form-group">
					<label>내용</label>
						<div><textarea name="content" rows="6"><%=board.getContent() %></textarea></div>
				</div>
				<div class="text-right">
					<button type="submit">등록</button>
				</div>
			</form>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>