<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>계산기 만들기</h2>
	- 계산하기 버튼을 누르면 입력양식 값들을 calculator_result.jsp 페이지로 전송한다.
	- 피연사 들과 선택한 연산자를 따져 연산의 결과를 calculator_result.jsp 에서 출력한다.
	<form>
		피연산자1 : <input type="number"><br>
		연산자 : 
		<input type="radio" name="oper" value="plus">+
		<input type="radio" name="oper" value="minus">-
		<input type="radio" name="oper" value="multi">*
		<input type="radio" name="oper" value="divide">/
		<br>
		피연산자2 : <input type="number"><br>
		<input type="submit" value="계산하기">
	</form>
</body>
</html>



