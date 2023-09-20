<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문</title>
</head>
<body>
	<h3>JSTL 코어 라이브러리 : 반복문</h3>
	<h4>상품 정보 출력</h4>
	<table>
		<tr>
			<th>상품명</th>
			<th>가격</th>
		</tr>
		<c:forEach var="goods" items="${goodsList}">
			<tr>
				<td>${goods.code}</td>
				<td>${goods.price}</td>
			</tr>
		</c:forEach>
	</table>

	<h4>구구단 출력</h4>
	<c:forEach var="i" begin="2" end="9" step="1" varStatus="outer">
		<!-- step은 1일경우 생략 가능 -->
		<c:forEach var="j" begin="1" end="9" step="1" varStatus="inner">
			<c:if test="${inner.first }">
				<font style="color: red;">${i }단</font>
				<br>
			</c:if>
		${i } x ${j } = ${i*j }<br>
		</c:forEach>
		<hr>
		<c:if test="${outer.last }">총 출력 단수: ${outer.count+1}</c:if>
	</c:forEach>
</body>
</html>