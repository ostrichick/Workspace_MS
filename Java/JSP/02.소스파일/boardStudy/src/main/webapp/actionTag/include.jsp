<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("include","testData");
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
	<%-- <%@include file="/include/header.jsp" %> --%>
	<jsp:include page="/include/header.jsp"/>
	<section>
		<h2>jsp 액션태그 include</h2>
		<%-- <%=loginUser.getId() %>님 환영합니다. --%>
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>