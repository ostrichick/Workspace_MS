<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>EL JSTL</title>
</head>
<body>
	<P>The time on the server is ${serverTime}.</P>
	<h2>EL과 JSTL 연습</h2>
	<div>
		<a href="${pageContext.request.contextPath}/built_in_object.do">EL의 내장객체 사용</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/java_bean.do">자바빈 사용</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/el_operation.do">연산식 사용</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/java_method.do">자바메소드 호출</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/java_collection.do">배열과 컬렉션 사용</a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/jsp_jstl.do">JSTL 사용</a>
	</div>

</body>
</html>
