<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
@charset "UTF-8";

header {
	background: lightgrey;
	border: 1px solid black;
	height: 100px;
}

.menuArea li {
	display: inline-block;
}

.loginArea {
	text-align: right;
	/* 	position: absolute; */
	/* 	right: 10px; */
	/* 	top: 10px; */
}

body {
	width: 60%;
	margin: auto;
}

table {
	margin: 30px auto;
	min-width: 600px;
}

table, tr, td, th {
	border: 2px lightgrey solid;
	padding: 10px;
	border-collapse: collapse;
}
</style>
<header>

	<nav>
		<div class="menuArea">
			<!-- 			<ul> -->
			<%-- 				<li><a href="<%=request.getContextPath()%>/write.jsp">게시판1</a> --%>
			<!-- 					|</li> -->
			<%-- 				<li><a href="<%=request.getContextPath()%>/board/list.jsp">게시판2</a> --%>
			<!-- 					|</li> -->
			<%-- 				<li><a href="<%=request.getContextPath()%>/member/list.jsp">게시판3</a></li> --%>
			<!-- 			</ul> -->
		</div>
		<div class="loginArea">
			<a href="<%=request.getContextPath()%>/member_index.do">메인</a> |
			<c:choose>
				<c:when test="${empty member_id }">
					<!--     로그인이 안 되어 있을 때 -->
					<a href="<%=request.getContextPath()%>/member_login.do">로그인</a> | <a
						href="<%=request.getContextPath()%>/member_join.do">회원가입</a>
				</c:when>
				<c:otherwise>
					<!-- 로그인이 되어있을 때 -->
					<a href="<%=request.getContextPath()%>/member_logout.do">로그아웃</a> | <a
						href="<%=request.getContextPath()%>/member_mypage.do">마이페이지</a>
				</c:otherwise>
			</c:choose>
			<c:if test="${member_grade ge 1 }">
				 | <a href="<%=request.getContextPath()%>/member_admin.do">회원관리
					페이지</a>
			</c:if>
		</div>
		<h3>EL JSTL 연습용 회원관리 페이지</h3>
	</nav>
</header>