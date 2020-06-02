<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="navibar">
	<ul>
		<li><a href="/simple-board/home.jsp">홈</a></li>
		<li><a href="/simple-board/board/list.jsp">게시판</a></li>
		<li><a href="/simple-board/user/my.jsp">내정보</a></li>
	
	<%
		String isLogined = (String) session.getAttribute("로그인여부");
	%>
	<%
		if ("Y".equals(isLogined)) {
	%>	
		<li class="right"><a href="/simple-board/user/logout.jsp">로그아웃</a></li>
	<%
		} else {
	%>
		<li class="right"><a href="/simple-board/user/loginform.jsp">로그인</a></li>
		<li class="right"><a href="/simple-board/user/form.jsp">회원가입</a></li>
	<%
		}
	%>
	</ul>
	
	<%
		if("Y".equals(isLogined)) {
			String username = (String) session.getAttribute("이름");
	%>
		<p><%=username %>님 환영합니다.</p>
	<%
		}
	%>
</div>