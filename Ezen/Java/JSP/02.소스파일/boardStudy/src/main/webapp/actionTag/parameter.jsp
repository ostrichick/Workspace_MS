<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<jsp:useBean id="user" class="boardStudy.User" scope="request"/>
	<jsp:setProperty name="user" property="*" />
	<jsp:setProperty name="user" property="addr" param="test" />
	<%@include file="/include/header.jsp" %>
	<section>
		<h2>jsp 액션태그 beans parameter</h2>
		<jsp:getProperty name="user" property="id" /> <br>
		<jsp:getProperty name="user" property="name" /> <br>
		<jsp:getProperty name="user" property="password" /> <br>
		<jsp:getProperty name="user" property="addr" /> <br>
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>