<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>e1을 사용하여 계산기 만들기</h2>
	<form action="calculator.jsp" method="get">
		num1 : <input type="number" name="num1"> <br>
		num2 : <input type="number" name="num2"> <br>
		<input type="radio" name="oper" value="plus">+
		<input type="radio" name="oper" value="minus">-
		<input type="radio" name="oper" value="multi">*
		<input type="radio" name="oper" value="div">/
		<br>
		<input type="submit" value="계산">
	</form>
	<!-- 
		삼항연산자
		 (조건식)?true:false
		 param.oper eq 'plus'? param.num1+param.num2 : ''
	
	 -->
</body>
</html>