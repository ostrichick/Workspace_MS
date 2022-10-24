<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>board2 list 출력 페이지</h2>
	
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.bidx}</td>
				<td>${item.title}</td>
				<td>${item.mid}</td>
				<td>${item.regdate}</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>