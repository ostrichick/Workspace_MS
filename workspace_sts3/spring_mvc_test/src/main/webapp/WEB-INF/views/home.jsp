<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h1>Hello world!</h1>
	<P>The time on the server is ${serverTime}.</P>
	<a href="${pageContext.request.contextPath }/home/test2.do?name=홍길동&id=hong&member_id=활빈당1">
		test2.do </a>
</body>
</html>
