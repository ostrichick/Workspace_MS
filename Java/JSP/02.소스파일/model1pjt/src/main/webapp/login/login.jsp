<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>로그인</h2>
	<form action="login_action.jsp" method="post">
		<p>
			id :<input type="text" name="id">
		</p>
		<p>
			password :<input type="password" name="password">
		</p>
		<p>
			<input type="submit" value="로그인">
		</p>
	</form>
</body>
</html>