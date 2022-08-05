<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parameter</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <jsp:useBean id="user" class="boardStudy.User" scope="request" />
  <jsp:setProperty name="user" property="*" /> <!-- 와일드카드 * 조건이 일치하면 알아서 다 가져옴 -->
  <jsp:setProperty name="user" property="addr" param="test" />
  <%@include file="/include/header.jsp"%>
  <section>
    <h2>JSP 액션태그 Beans Parameter</h2>
    이름: <jsp:getProperty name="user" property="name" />
    <br>
    id: <jsp:getProperty name="user" property="id" />
    <br>
    password: <jsp:getProperty name="user" property="password" />
    <br>
    addr: <jsp:getProperty name="user" property="addr" />
    <br>
<%--     <jsp:getProperty name="user" property="test" /> --%>
<!--     <br> -->

  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>