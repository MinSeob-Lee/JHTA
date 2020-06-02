<%@page import="com.simple.vo.Reply"%>
<%@page import="com.simple.dao.ReplyDao"%>
<%@page import="com.simple.dto.BoardDto"%>
<%@page import="com.simple.vo.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.simple.dao.BoardDao"%>
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
		<h1>게시글 상세정보</h1>
	</div>
	<div class="body">
	<%
		String position = "board";
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDao boardDao = new BoardDao();
		BoardDto boardDto = boardDao.getBoardByNo(no);
		ReplyDao replyDao = new ReplyDao();
		List<Reply> replys = replyDao.getReplyByBoardNo(no);
	%>
		<p>게시글의 내용을 확인하고, 댓글도 달아보세요.</p>
		<div>
			<table class="table bordered">
				<colgroup>
					<col width="10%">
					<col width="40%">
					<col width="10%">
					<col width="40%">
				</colgroup>
				<tbody>
					<tr>
						<th>제목</th>
						<td colspan="3"><%=boardDto.getTitle() %></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><a href="writers.jsp?userid=<%=boardDto.getWriter() %>"><%=boardDto.getWriter() %></a></td>
						<th>등록일</th>
						<td><%=boardDto.getCreatedDate() %></td>
					</tr>
					<tr>
						<th>조회수</th>
						<td><%=boardDto.getHit() %></td>
						<th>댓글갯수</th>
						<td><%=boardDto.getReplyCnt() %></td>
					</tr>
					<tr>
						<th style="vertical-align: top;">내용</th>
						<td colspan="3" style="vertical-align:top; height:200px; min-height: 200px;"><%=boardDto.getContent() %></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="text-right">
			[<a href="modifyform.jsp?no=<%=no %>">수정하기</a>]
			[<a href="delete.jsp?no=<%=no %>">삭제하기</a>]
			[<a href="list.jsp">목록가기</a>]
		</div>
	</div>
	<div>
	<p>댓글 확인</p>
	<table class="table">
	<colgroup>
		<col width="10%">
		<col width="40%">
		<col width="10%">
		<col width="40%">
	</colgroup>
	<%
		for (Reply reply : replys) {
	%>
		<tr>
			<th>작성자</th>
			<td><%=reply.getWriter() %></td>
			<th>작성일자</th>
			<td><%=reply.getCreatedDate() %></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=reply.getContent() %></td>
		</tr>
	<%
		}
	%>
	</table>	
	</div>
	<h4>댓글 작성</h4>
	<%
		
	%>
	<div class="well">
		<form method="post" action="../reply/register.jsp">
		<input type="hidden" name="boardno" value="<%=no %>" />
			<div class="form-group">
				<label>내용</label>
					<div><textarea rows="7" name="content"></textarea></div>
			</div>
			<div class="text-right">
					<button type="submit">등록</button>
				</div>
		</form>
	</div>
	<div class="footer">
		<%@ include file="../common/footer.jsp" %>
	</div>
</div>
</body>
</html>