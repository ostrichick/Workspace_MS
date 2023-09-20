<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Cookie cookie = new Cookie("cookie1", "sampleCookie");
response.addCookie(cookie);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h3>익스프레션</h3>
  <%=request.getParameter("test1")%>
  <br>
  <%=request.getParameter("test2")%>
  <br>
  <%
  for (String pv : request.getParameterValues("c1")) {
  	out.println(pv + "<br>");
  }
  %>
  <hr />
  <%
  Cookie[] cookies = request.getCookies();
  for (Cookie cookieTemp : cookies) {
  	if (cookieTemp.getValue().equals("cookie1")) {
  		out.print(cookieTemp.getValue());
  	}
  }
  %>
  <br>
  <hr />
  <h3>EL</h3>
  ${param.test1}
  <br> ${param.test2}
  <br> ${paramValues.c1[0]}
  <br> ${paramValues.c1[1]}
  <br> ${paramValues.c1[2]}
  <br> ${paramValues.c1[3]}
  <br> ${paramValues.c1[4]}
  <hr />${cookie.cookie1.value }

</body>
</html>