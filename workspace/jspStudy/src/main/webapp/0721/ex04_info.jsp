<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%
String name = request.getParameter("name");
String info = request.getParameter("info");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getParameter</title>
</head>
<body>
 이름 : <%=name %> <br /> 정보 : <%=info %> <br />
</body>
</html>