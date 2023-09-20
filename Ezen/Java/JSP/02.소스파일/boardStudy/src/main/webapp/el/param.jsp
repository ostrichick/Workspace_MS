<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] c1s = request.getParameterValues("c1");
	String test1 = request.getParameter("test1");
	String test2 = request.getParameter("test2");
	
	Cookie cookie = new Cookie("cookie1","sampleCookie");
	response.addCookie(cookie);
	
	Cookie[] cookies = request.getCookies();
	
	for(Cookie cookieTemp : cookies){
		if(cookieTemp.getName().equals("cookie1")){
			out.print(cookieTemp.getValue());
		}
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= test1 %>
	<%= test2 %>
	<%for(String c1 :c1s){
		out.println(c1);
	}
	
	%>
	<h2>el 사용하기</h2>
	${param.test1}
	${param.test2}
	${paramValues.c1[0]}
	${paramValues.c1[1]}
	${paramValues.c1[2]}
	${paramValues.c1[3]}
	<br>
	${cookie.cookie1.value}
	
</body>
</html>