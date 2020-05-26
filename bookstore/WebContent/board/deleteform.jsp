<%@page import="com.bookstore.util.StringUtil"%>
<%@page import="com.bookstore.dto.BoardDto"%>
<%@page import="com.bookstore.util.NumberUtil"%>
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
	<div class="navi">
		<%
			String position = "board";
		%>
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>게시글 수정</h1>
	</div>
	<div class="body">
	<%
		int no = NumberUtil.stringToInt(request.getParameter("boardno"));
		String err = StringUtil.nullToBlank(request.getParameter("err"));
		if("password".equals(err)) {
	%>
		<p style="color: red"><strong>비밀번호가 틀려 오류가 발생했습니다.</strong></p>
	<%
		}
	
		BoardDao boardDao = new BoardDao();
		BoardDto board = boardDao.getBoardByNo(no);
	%>
		<p>게시글 정보를 입력하세요.</p>
		<div class="well">
			<form method="post" action="delete.jsp">
			<input type="hidden" name="boardno" value="<%=no %>">
				<div class="form-group">
					<label>제목</label>
					<div><input type="text" name="title" value="<%=board.getTitle() %>" disabled/></div>
				</div>
				<div class="form-group">
					<label>작성자</label>
					<div><input type="text" name="writer" value="<%=board.getWriter() %>" disabled/></div>
				</div>
				<div class="form-group">
					<label>비밀번호</label>
					<div><input type="password" name="password" maxlength="4"/></div>
				</div>
				<div class="form-group">
					<label>내용</label>
					<div><textarea rows="6" name="content" disabled><%=board.getContent()%></textarea> </div>
				</div>
				<div class="text-right">
					<button type="submit">수정</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>