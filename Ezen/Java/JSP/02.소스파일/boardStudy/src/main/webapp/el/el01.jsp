<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnt = 10;
	request.setAttribute("cnt",20);
	pageContext.setAttribute("cnt",30);
	
	session.setAttribute("sample","sessionScope");
	request.setAttribute("sample","requestScope");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=cnt %>
	<%=(Integer)request.getAttribute("cnt")%>
	${cnt}
	${sessionScope.sample}
	
	<form action="param.jsp" method="get">
		<input type="text" name="test1"><br>
		<input type="text" name="test2"><br>
		<input type="checkbox" name="c1" value="1">1
		<input type="checkbox"  name="c1" value="2">2
		<input type="checkbox" name="c1" value="3">3
		<input type="checkbox" name="c1" value="4">4
		<br>
		<input type="submit">
	</form>
	
</body>
</html>