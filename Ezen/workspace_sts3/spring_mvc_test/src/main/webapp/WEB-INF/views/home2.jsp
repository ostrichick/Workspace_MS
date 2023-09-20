<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<h4>이름 : ${name } / 아이디 : ${id }</h4>
	<hr />
	멤버아이디 : ${member_id }
	<hr />
	<a href="${pageContext.request.contextPath }/home/test3/100"> 요청
		URL에 전달값을 포함시켜 서버로 전송</a>
</body>
</html>
