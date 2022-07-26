<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%
String data1 = request.getParameter("data1");
String data2 = request.getParameter("data2");
String data3 = request.getParameter("data3");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 받아오기!</title>
</head>
<body>
		<p>
				데이터 1 :
				<%=data1 + "_parameter"%></p>
		<br />
		<p>
				데이터 2 :
				<%=data2 + "_parameter"%></p>
		<br />
		<p>
				데이터 3 :
				<%=data3 + "_parameter"%></p>
		<br />
</body>
</html>