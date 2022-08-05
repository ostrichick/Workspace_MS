<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포워드</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 400px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <%--   <jsp:include page="/include/header.jsp" /> --%>
  <section>
    <h2>JSP 액션태그 forward</h2>
    forward.jsp입니다
    <%=request.getParameter("testData") %>

  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>