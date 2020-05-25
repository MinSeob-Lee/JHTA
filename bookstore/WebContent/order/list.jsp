<%@page import="com.bookstore.vo.User"%>
<%@page import="com.bookstore.dao.UserDao"%>
<%@page import="java.util.List"%>
<%@page import="com.bookstore.dao.OrderDao"%>
<%@page import="com.bookstore.dto.OrderDto"%>
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
				String position = "order";
			%>
			<%@ include file="../common/navibar.jsp" %>
		</div>
		<div class="header">
			<h1>주문내역 조회</h1>
		</div>
		<div class="body">
		<%
		String userId = request.getParameter("userid");
		
		OrderDao orderDao = new OrderDao();
		UserDao userDao = new UserDao();
		User user = userDao.getUserById(userId);
		List<OrderDto> orderDtos = orderDao.getOrderByUserId(userId);
		%>
			<div>
				<h3>[<%=user.getName() %>]님의 주문내역입니다.</h3>
				<p>보유 포인트 : <strong><%=user.getPoint() %></strong> 점</p>
				<table class="table">
					<thead>
						<tr>
							<th>주문번호</th>
							<th>제목</th>
							<th>주문가격</th>
							<th>주문수량</th>
							<th>결제금액</th>
							<th>주문일자</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
	<%
		if (orderDtos.isEmpty()) {
	%>
						<tr>
							<td colspan="7" class="text-center">등록된 주문내역이 존재하지 않습니다.</td>
						</tr>
	<%
		} else {
			for (OrderDto orderDto : orderDtos) {
	%>
						<tr>
							<td><%=orderDto.getNo() %></td>
							<td><a href="../book/detail.jsp?bookno=<%=orderDto.getBookNo() %>"><%=orderDto.getBookTitle() %></a></td>
							<td><%=orderDto.getPrice() %></td>
							<td><%=orderDto.getAmount() %></td>
							<td><%=orderDto.getChargedPrice() %></td>
							<td><%=orderDto.getRegisteredDate() %></td>
			<%
				if (orderDto.getReviewNo() != -1) {
			%>
							<td>리뷰작성완료</td>
			<% } else { 
			%>
							<td><a href="../review/form.jsp?bookno=<%=orderDto.getBookNo()%>&userid=<%=user.getId()%>">리뷰작성</a></td>
						</tr>
	<%
				}
			}
		}
	%>
					</tbody>
				</table>
			</div>
		</div>
		<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>