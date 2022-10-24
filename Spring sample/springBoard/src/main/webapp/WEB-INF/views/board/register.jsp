<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 등록!</h2>
	
	<form action="register.do" method="post">
		<table border="1">
			<tr>
				<th>제목:</th>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<th>작성자:</th>
				<td>${login.mid}</td>
			</tr>
			<tr>
				<th>내용:</th>
				<td><textarea name="content" rows="10" cols="60"></textarea></td>
			</tr>
		</table>
		<p>
			<button>저장</button>
		</p>
	</form>
</body>
</html>