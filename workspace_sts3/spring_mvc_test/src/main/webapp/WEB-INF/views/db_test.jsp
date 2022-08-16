<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB TEST</title>
</head>
<body>
	<h3>MySQL에 데이터 입력</h3>
	<hr />
	<p>요청처리 메소드의 Map형 매개변수에 데이터 매핑</p>
	<form action="${pageContext.request.contextPath}/home/db_test2.do"
		method="post">
		<p>
			아이디 : <input type="text" name="member_id" />
		</p>
		<p>
			비밀번호 : <input type="password" name="member_pw" />
		</p>
		<p>
			이름 : <input type="text" name="member_name" />
		</p>
		<p>
			<input type="submit" />
		</p>
	</form>
	<hr />
	서버로부터 받은 결과
	<br />
	<div id="result"></div>
</body>
</html>