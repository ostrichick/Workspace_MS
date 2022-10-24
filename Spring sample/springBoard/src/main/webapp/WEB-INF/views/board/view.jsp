<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 상세페이지</h2>
	<table border="1" width="80%">
		<tr>
			<th>제목</th>
			<td>${vo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.mid }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${vo.regdate }</td>
		</tr>
		<tr height="100">
			<th>내용</th>
			<td>${vo.content}</td>
		</tr>
	</table>
	<c:if test="${vo.midx eq login.midx}">
	<p>
		<button onclick="location.href='modify.do?bidx=${vo.bidx}'">수정</button>
		<button onclick="document.delfrm.submit();">삭제</button>
	</p>
	<form action="delete.do" method="post" name="delfrm">
		<input type="hidden" name="bidx" value="${vo.bidx}">
	</form>
	</c:if>
</body>
</html>