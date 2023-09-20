<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
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
	<h2>게시글 수정</h2>
	<form action="modify.do" method="post">
	<input type="hidden" name="bidx" value="${vo.bidx}">
		<table border="1" width="80%">
			<tr>
				<th>제목:</th>
				<td><input type="text" size="50" name="title" value="${vo.title}"></td>
			</tr>
			<tr>
				<th>작성자:</th>
				<td>${vo.mid}</td>
			</tr>
			<tr>
				<th>작성일:</th>
				<td>${vo.regdate}</td>
			</tr>
			<tr height="100">
				<th>내용:</th>
				<td><textarea name="content" rows="10" cols="60">${vo.content}</textarea></td>
			</tr>
		</table>
		
		<button>저장</button>
	</form>

</body>
</html>