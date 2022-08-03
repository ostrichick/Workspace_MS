<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체사용</title>
</head>
<body>
<h2>EL 내장객체</h2>
<p>session 객체에 저장한 member_id 값 : ${member_id}</p>
<p>cookie에 저장한 장바구니의 제품번호 : ${cookie.CART01.value}</p>
</body>
</html>