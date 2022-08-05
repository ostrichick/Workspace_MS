<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <h2>JSP 액션태그 Beans</h2>
    <jsp:useBean id="user1" class="boardStudy.User" scope="request" />
    <jsp:setProperty name="user1" property="id" value="김춘삼" />
    <!--     id : -->
    <%--     <jsp:getProperty name="user1" property="id" /> --%>
    <!-- useBean 태그를 사용하여 user2 자바빈즈를 생성
    id:tester2, name:테스터2, password:1234, addr:전주시, uidx:2 화면에 출력-->
    <jsp:useBean id="user2" class="boardStudy.User" scope="request" />
    <jsp:setProperty name="user2" property="id" value="tester2" />
    <jsp:setProperty name="user2" property="name" value="테스터2" />
    <jsp:setProperty name="user2" property="password" value="1234" />
    <jsp:setProperty name="user2" property="addr" value="전주시" />
    <jsp:setProperty name="user2" property="uidx" value="2" />
    <br>아이디:
    <jsp:getProperty name="user2" property="id" />
    <br>이름:
    <jsp:getProperty name="user2" property="name" />
    <br>비밀번호:
    <jsp:getProperty name="user2" property="password" />
    <br>주소:
    <jsp:getProperty name="user2" property="addr" />
    <br>회원번호:
    <jsp:getProperty name="user2" property="uidx" />
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>