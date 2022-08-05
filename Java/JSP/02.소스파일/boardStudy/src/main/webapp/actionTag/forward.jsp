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
	<%@include file="/include/header.jsp" %>
	<section>
		<h2>jsp 액션태그 forward</h2>
		forward.jsp 입니다.
		<%= request.getParameter("testData")%>
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>