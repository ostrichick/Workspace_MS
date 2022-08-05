<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	<form action="join_action.jsp" method="post">
		<p>
			id : <input type="text" name="id">
		</p>
		<p>
			name : <input type="text" name="name">
		</p>
		<p>
			password : <input type="password" name="password">
		</p>
		<p>
			addr : <input type="text" name="addr">
		</p>
		<p>
			<input type="submit" value="회원가입">
		</p>
	</form>
</body>
</html>