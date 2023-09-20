<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 자바 메소드</title>
</head>
<body>
	<h2>표현식을 이용한 메소드 사용</h2>
	<%@ page import="ezen.spring.util.MathUtil"%>
	<%
	MathUtil mathUtil = new MathUtil();
	int num = 55;
	%>
	1부터 100까지 합계
	<%=MathUtil.sum(1, 100)%>
	<br>55는 짝수?
	<%=mathUtil.checkEven(55)%>
	<hr>
	요청 URL:<%=request.getRequestURL()%>
	<br /> 요청 URI:<%=request.getRequestURI()%>
	<br /> 컨텍스트 경로(contextPath):<%=request.getContextPath()%>
	<br /> 컨텍스트 경로(contextPath):<%=application.getContextPath()%>
	<br />

	<hr />
	<h2>EL을 이용한 메소드 사용</h2>
	<jsp:useBean id="mathUtil2" class="ezen.spring.util.MathUtil" />
	1부터 100까지 합계 ${MathUtil.sum(1, 100)}
	<br>55는 짝수? ${mathUtil2.checkEven(55)}
	<!-- 	변수를 바로 EL로 가져와 쓸 수 없음. 내장객체로 저장해야함 -->
	요청 URL: ${pageContext.request.requestURL}
	<br /> 요청 URI: ${pageContext.request.requestURI}
	<br /> 컨텍스트 경로(contextPath): ${pageContext.request.contextPath}
	<br /> 컨텍스트 경로(contextPath): ${pageContext.servletContext.contextPath}
	<br />
</body>
</html>