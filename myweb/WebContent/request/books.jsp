<%@page import="com.smaple.vo.Book"%>
<%@page import="java.util.List"%>
<%@page import="com.sample.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	BookDao bookDao = new BookDao();
	List<Book> books = bookDao.getAllBooks();
%>

	<table border="1" style="width: 100%;">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>저자</th>
				<th>장르</th>
				<th>출판사</th>
				<th>가격</th>
				<th>할인가격</th>
				<th>등록일</th>
				<th>재고수량</th>
				<th>포인트</th>
				<th>추천수</th>
			</tr>
		</thead>
		<tbody>
	<%
		for (Book book : books) {
	%>
			<tr>
				<td><%=book.getNo() %></td>
				<td><%=book.getTitle() %></td>
				<td><%=book.getWriter() %></td>
				<td><%=book.getGenre() %></td>
				<td><%=book.getPublisher() %></td>
				<td><%=book.getPrice() %></td>
				<td><%=book.getDiscountPrice() %></td>
				<td><%=book.getRegisteredDate() %></td>
				<td><%=book.getStock() %></td>
				<td><%=book.getPoint() %></td>
				<td><%=book.getLikes() %></td>
			</tr>
	<%
		}
	%>
		</tbody>
	</table>
</body>
</html>