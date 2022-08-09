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
	min-height: 500px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h3>회원 관리 페이지</h3>
		<h5>
			<c:if test="${not empty adminResult}">${adminResult}</c:if>
			<c:if test="${not empty delResult}">${delResult}</c:if>
		</h5>
		<table>
			<tr>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰</th>
				<th>성별</th>
				<th>회원등급</th>
				<th>탈퇴여부</th>
				<th>삭제</th>
			</tr>
			<c:forEach items="${requestScope.mList}" var="memberVo">
				<tr>
					<td>${memberVo.member_idx}</td>
					<td>${memberVo.member_id}</td>
					<td>${memberVo.member_name }</td>
					<td>${memberVo.member_handphone }</td>
					<td>${memberVo.member_gender }</td>
					<td>${memberVo.member_grade }</td>
					<td>${memberVo.del_yn }</td>
					<td>
						<form action="member_delMember.do" method="post">
							<input type="hidden" name="member_idx" value="${memberVo.member_idx }" />
							<input type="submit" value="삭제" />
						</form>
					</td>
				</tr>
			</c:forEach>

		</table>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>