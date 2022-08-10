<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String test = (String) request.getAttribute("test");
@SuppressWarnings("unchecked")
Map<String, String> uinfo = (Map<String, String>) request.getAttribute("uinfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
  <h3>게시글 목록</h3>
  <%=request.getAttribute("test")%>
  <hr />
  <%=test%>
  <hr />
  이름 :
  <%=uinfo.get("이름")%>
  <br /> 나이 :
  <%=uinfo.get("나이")%>
  <br /> 주소 :
  <%=uinfo.get("주소")%>
  <br />
</body>
</html>