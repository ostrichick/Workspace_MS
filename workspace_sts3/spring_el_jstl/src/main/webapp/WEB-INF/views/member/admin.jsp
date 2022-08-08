<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리 페이지</title>
<style>
section {
	height: 500px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h3>회원 관리 페이지</h3>
		<table>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰</th>
				<th>성별</th>
				<th>회원등급</th>
				<th>탈퇴여부</th>
			</tr>
			<c:forEach items="${member_list}" var="board">
				<tr>
					<td>${member_idx }</td>
					<td>${member_id }</td>
					<td>${member_name }</td>
					<td>${member_handphone }</td>
					<td>${member_gender }</td>
					<td>${member_grade }</td>
					<td>${del_yn }</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>