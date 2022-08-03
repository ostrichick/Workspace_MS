<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문결과</title>
</head>
<body>
	<h2>설문 결과</h2>
	<p>좋아하는 계절 : ${param.season}</p>
	<p>좋아하는 음식 : ${paramValues.menu[0]}&nbsp;&nbsp;
		${paramValues.menu[1]}&nbsp;&nbsp; ${paramValues.menu[2]}&nbsp;&nbsp;
		${paramValues.menu[3]}&nbsp;&nbsp;</p>
	<br>
	<a href="${pageContext.request.contextPath}/">메인으로</a>
</body>
</html>