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
	<h2>회원 가입 페이지!</h2>
	
	<form action="join.do" method="post">
		<table>
			<tr>
				<th>아이디:</th>
				<td><input type="text" name="mid" size="10"></td>
			</tr>
			<tr>
				<th>비밀번호:</th>
				<td><input type="password" name="password" size="20"></td>
			</tr>
			<tr>
				<th>주소:</th>
				<td><input type="text" name="addr" size="50"></td>
			</tr>
			<tr>
				<th>연락처:</th>
				<td><input type="text" name="phone" size="15"></td>
			</tr>
		</table>
		<p/>
		<button>회원가입</button>
	</form>
</body>
</html>








