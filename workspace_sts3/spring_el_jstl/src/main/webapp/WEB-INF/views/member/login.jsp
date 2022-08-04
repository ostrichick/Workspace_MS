<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h2>로그인</h2>
		<form action="member_loginProcess.do" method="post">
			<fieldset>
				<legend>입력</legend>
				<p>
					<label for="">id : <input type="text" name="member_id" /></label>
				</p>
				<p>
					<label for="">password : <input type="password"
						name="member_pw" /></label>
				</p>
				<p>
					<input type="submit" value="로그인" />
				</p>
			</fieldset>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>