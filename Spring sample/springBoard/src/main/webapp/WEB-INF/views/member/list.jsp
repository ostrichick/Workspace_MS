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
	<h2>회원 목록 화면</h2>
	
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>회원아이디</th>
			<th>가입일</th>
		</tr>
		<c:if test="${list.size() > 0 }">
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.midx }</td>
					<td>${item.mid }</td>
					<td>${item.regdate }</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${list.size() == 0 }">
			<tr>
				<td colspan="3">등록된 회원이 없습니다.</td>
			</tr>
		</c:if>
	</table>
</body>
</html>
