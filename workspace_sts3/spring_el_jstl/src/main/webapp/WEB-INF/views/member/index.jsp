<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 시스템 메인</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<h3>회원관리시스템</h3>
	<p>
		<a href="${pageContext.request.contextPath}/connection_test.do">오라클DB
			연결테스트</a>
	</p>
	<p>
<c:if test="${not empty joinRresult }">${joinResult }</c:if>
<c:if test="${not empty loginRresult }">${loginResult }</c:if>
	</p>
	<%@include file="footer.jsp"%>
</body>
</html>