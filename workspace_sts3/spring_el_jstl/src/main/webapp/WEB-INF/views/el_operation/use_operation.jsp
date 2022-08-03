<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 사용</title>
</head>
<body>
	<h2>EL 연산자 사용</h2>
	X = ${num1} , Y = ${num2}
	<br> X + Y = ${num1+num2}
	<br> X / Y = ${num1/num2}
	<br> X는 Y보다 큰가? ${num1 > num2}
	<br> X는 Y보다 작은가? ${num1 lt num2}
	<br> X와 Y는 양수인가? ${num1>0 and num2>0}
	<br> X와 Y는 같은가? ${num1 == num2? "네" : "아니오" }
</body>
</html>