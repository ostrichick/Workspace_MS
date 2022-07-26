<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="boardStudy.User" %>
<%
	User login = (User)session.getAttribute("login");
%>    
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css">
<style>
	section{
		height:400px;
	} 
</style> 
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<section>
	<!-- 로그인 후 로그인한 회원의 이름(name) -->
	<%
		if(loginUser != null){
	%>
	<h2><%= loginUser.getName() %> 님 환영합니다.</h2>
	<%
		}else{
	%>
	<!-- 로그인 되어 있지 않은 경우 -->
	<h2>첫 방문을 환영합니다.</h2>
	<%
		}
	%>
	
	메인페이지 입니다.
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>





