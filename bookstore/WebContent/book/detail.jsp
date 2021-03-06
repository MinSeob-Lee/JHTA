<%@page import="com.bookstore.util.NumberUtil"%>
<%@page import="com.bookstore.vo.Review"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dto.ReviewDto"%>
<%@page import="com.bookstore.dao.ReviewDao"%>
<%@page import="com.bookstore.dto.BookDetailDto"%>
<%@page import="com.bookstore.dao.BookDao"%>
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
		String position = "book";
	%>
		<div class="navi">
			<%@ include file="../common/navibar.jsp" %>
		</div>
		<div class="header">
			<h1>책 정보</h1>
		</div>
		<div class="body">
		<%
			int bookNo = Integer.parseInt(request.getParameter("bookno"));
			BookDao bookDao = new BookDao();
			BookDetailDto book = bookDao.getBookByNo(bookNo);
			ReviewDao reviewDao = new ReviewDao();
			List<ReviewDto> reviews = reviewDao.getReviewByNo(bookNo);
		%>
		<div>
			<h3>책의 상세정보</h3>
			<table class="table bordered">
				<tr>
					<th>제목</th>
					<td colspan="3"><%=book.getTitle() %></td>
				</tr>
				<tr>
					<th>저자</th>
					<td><%=book.getWriter() %></td>
					<th>출판사</th>
					<td><%=book.getPublisher() %></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><%=book.getPoint() %></td>
					<th>리뷰개수</th>
					<td><%=book.getReviewCnt() %></td>
				</tr>
				<tr>
					<th>가격</th>
					<td><%=NumberUtil.numberWithComma(book.getPrice()) %> 원</td>
					<th>할인가격</th>
					<td><%=NumberUtil.numberWithComma(book.getDiscountPrice()) %> 원</td>
				</tr>
				<tr>
					<th>추천수</th>
					<td><%=book.getLikes() %>개</td>
					<th>재고</th>
					<td><%=book.getStock() %> 권</td>
				</tr>
			</table>
			<div class="text-right">
			<button type="button"><a href="list.jsp">전체목록으로</a></button>
			</div>
			<div>
				<h3>이 책의 리뷰</h3>
				<table class="table">
					<tbody>
	<%
		if (reviews.isEmpty()) {
	%>
						<tr>
							<td>등록된 리뷰가 존재하지 않습니다.</td>
						</tr>
	<%
		} else {
			for (ReviewDto review : reviews) {
	%>
						<tr>
							<th>작성자</th>
							<td><%=review.getUserName() %></td>
							<th>평점</th>
							<td><%=review.getPoint() %> 점</td>
							<th>작성일</th>
							<td><%=review.getRegisteredDate() %></td>
						</tr>
						<tr>
							<td colspan="6"><%=review.getContent() %></td>
						</tr>
	<%
			}
		}
	%>
					</tbody>
				</table>
			</div>
		</div>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>