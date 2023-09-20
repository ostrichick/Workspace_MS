<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%
String loginID = (String) session.getAttribute("loginID"); // 가져온 어트리뷰트를 세션에 적용할때 형변환
%>
<% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h2><%=loginID%>님, 환영합니다
  </h2>
</body>
</html>