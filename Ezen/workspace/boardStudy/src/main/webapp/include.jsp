<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setAttribute("include", "testData");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 400px;
}
</style>
</head>
<body>
  <%--         <%@include file="/include/header.jsp"%> --%>
  <jsp:include page="/include/header.jsp" />
  <section>
    <h2>JSP 액션태그 include</h2>
    <%--     <%=loginUser.getId()%> --%>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>