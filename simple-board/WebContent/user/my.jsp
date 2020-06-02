<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
<%@page import="com.simple.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/logincheck.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Simple Board</title>
<link rel="stylesheet" type="text/css" href="../resources/css/style.css">
</head>
<body>
<div class="wrapper">
	<div class="navi">
		<%@ include file="../common/navibar.jsp" %>
	</div>
	<div class="header">
		<h1>나의 정보</h1>
	</div>
	<div class="body">
	<%
		String writer = (String) session.getAttribute("아이디");
	
		BoardDao boardDao = new BoardDao();
		List<Board> boards = boardDao.getBoardByWriter(writer);
		ReplyDao replyDao = new ReplyDao();
		List<Reply> replys = replyDao.getReplyByWriter(writer);
	%>
		<p><strong><%=writer %></strong>님의 정보를 확인하세요</p>		
		<div>
			<h3>내가 작성한 글</h3>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th>제목</th>
						<th class="text-center">조회수</th>
						<th class="text-center">댓글수</th>
						<th class="text-center">삭제여부</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
		<%
			for (Board board : boards) {
		%>
					<tr>
						<td class="text-center"><%=board.getNo() %></td>
						<td><a href="../board/detail.jsp?no=<%=board.getNo() %>"><%=board.getTitle() %></a></td>
						<td class="text-center"><%=board.getHit() %></td>
						<td class="text-center"><%=board.getReplyCnt() %></td>
						<td class="text-center"><%=board.getDelYn() %></td>
						<td class="text-center"><%=board.getCreatedDate() %></td>
					</tr>
		<%
			}
		%>
				</tbody>
			</table>
		</div>
		
		<div>
			<h3>내가 작성한 댓글</h3>
			<table class="table">
				<colgroup>
					<col width="10%">
					<col width="*">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead>
					<tr>
						<th class="text-center">번호</th>
						<th>내용</th>
						<th class="text-center">삭제여부</th>
						<th class="text-center">등록일</th>
					</tr>
				</thead>
				<tbody>
		<%
			for (Reply reply : replys) {
		%>
					<tr>
						<td class="text-center"><%=reply.getNo() %></td>
						<td><%=reply.getContent() %></td>
						<td class="text-center"><%=reply.getDelYn() %></td>
						<td class="text-center"><%=reply.getCreatedDate() %></td>
					</tr>
		<%
			}
		%>
				</tbody>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>