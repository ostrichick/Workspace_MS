<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{
		text-align:right;
	}
</style>
</head>
<body>
	<h2>로그인!</h2>
	
	<form action="login.do" method="post">
		<table>
			<tr>
				<th>아이디:</th>
				<td><input type="text" name="mid"></td>
			</tr>
			<tr>
				<th>비밀번호:</th>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<p>
			<button>로그인</button>
		</p>
	</form>

</body>
</html>