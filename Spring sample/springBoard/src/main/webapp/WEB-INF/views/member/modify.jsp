<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th{text-align:right;}
</style>
</head>
<body>
	<h2>회원 정보 수정</h2>
	<form action="modify.do" method="post">	
		<input type="hidden" name="midx" value="${vo.midx }">
		<table>
			<tr>
				<th>회원번호:</th>
				<td>${vo.midx}</td>
			</tr>
			<tr>
				<th>회원아이디:</th>
				<td>${vo.mid}</td>
			</tr>
			<tr>
				<th>비밀번호:</th>
				<td><input type="password" name="password" value=""></td>
			</tr>
			<tr>
				<th>주소:</th>
				<td><input type="text" name="addr" value="${vo.addr}"></td>
			</tr>
			<tr>
				<th>연락처:</th>
				<td><input type="text" name="phone" value="${vo.phone}"></td>
			</tr>
		</table>
		
		<p>
			<button>저장</button>
		</p>
	</form>
</body>
</html>