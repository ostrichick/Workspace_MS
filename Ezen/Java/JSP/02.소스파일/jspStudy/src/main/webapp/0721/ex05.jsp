<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		데이터1은 data1,데이터2은 data2,데이터3은 data3 의 키로 입력 값을 넘기세요.
		각각 사용자가 입력하 3개의 데이터 뒤에 _parameter 라는 텍스트를 추가하여
		ex05_info.jsp에 전부 출력해주세요. 
	</h2>
	<form action="ex05_info.jsp" method="post">
		데이터1 : <input type="text" name="data1"> <!-- 안녕하세요 -> 안녕하세요_parameter -->
		<br>
		데이터2 : <input type="number" name="data2">
		<br>
		데이터3 : <textarea name="data3"></textarea>
		<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>