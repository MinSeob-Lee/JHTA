<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.vo.Reply"%>
<%@page import="com.bookstore.dao.ReplyDao"%>
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
			int no = NumberUtil.stringToInt(request.getParameter("boardno"));
		
			BoardDao boardDao = new BoardDao();
			BoardDto board = boardDao.getBoardByNo(no);
			ReplyDao replyDao = new ReplyDao();
			List<Reply> replys = replyDao.getReplysByBoardNo(no);
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
				<hr>
				<div class="text-right">
				<a href="modifyform.jsp?boardno=<%=no %>"><strong>[수정]</strong></a>
				<a href="deleteform.jsp?boardno=<%=no %>"><strong>[삭제]</strong></a>
				<a href="list.jsp"><strong>[목록으로 가기]</strong></a>
			</div>
				<div>
					<p><strong>댓글을 확인하세요</strong></p>
		<%
			for (Reply reply : replys) {
		%>
					<table class="table">
						<colgroup>
							<col width="10%">
							<col width="40%">
							<col width="10%">
							<col width="40%">
						</colgroup>
						<tr>
							<th>작성자</th>
							<td><%=reply.getWriter() %></td>
							<th>등록일</th>
							<td><%=reply.getRegisteredDate() %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td colspan="3">
								<%=StringUtil.strWithBr(reply.getContent()) %>
							</td>
						</tr>
						<hr>
					</table>
		<%
			}
		%>
				</div>
				<div style="width: 50%" class="well">
				<h3>댓글 작성</h3>
					<form method="post" action="registerreply.jsp">
						<input type="hidden" name="boardno" value="<%=no %>">
						<table class="table boardered">
							<tr>
								<td><input style= "width: 100%" type="text" name="writer" placeholder="닉네임"/></td>		
								<td><input style= "width: 100%" type="password" name="password" maxlength="4" placeholder="비밀번호"/></td>
							</tr>
							<tr>
								<td colspan="2"><textarea style="width: 100%" rows="6" name="content" placeholder="내용을 입력해주세요."></textarea></td>
							</tr>
						</table>
						<div class="text-right">
							<button type="submit">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>