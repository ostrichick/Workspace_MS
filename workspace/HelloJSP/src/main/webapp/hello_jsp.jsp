<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>첫번재 JSP 페이지</title>
</head>
<body>
  ㅇㅅㅇ

  <%
int sum = 0;
for (int i = 0; i < 101; i++) {
	sum += i;
	out.print(sum + "<br>");
}
%>
</body>
</html>