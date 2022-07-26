<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String data1 = request.getParameter("data1");
	String data2 = request.getParameter("data2");
	String data3 = request.getParameter("data3");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= data1+"_parameter" %> <br>
	<%= data2+"_parameter" %> <br>
	<%= data3+"_parameter" %> <br>
</body>
</html>







