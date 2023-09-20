<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home3</title>
</head>
<body>
	<h3>home3</h3>
	제품 번호 ${product_id }
	<hr />
	<a href="${pageContext.request.contextPath }/home/P001/C001/test4.do">
		요청 정보에 전달값을 포함시켜 서버로 전송하기</a>
</body>
</html>