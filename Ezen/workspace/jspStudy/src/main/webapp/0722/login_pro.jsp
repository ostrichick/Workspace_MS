<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%
String sessionID = request.getParameter("id");
String sessionPW = request.getParameter("pw");

if ((sessionID.equals("tester1") && sessionPW.equals("1234"))
		|| (sessionID.equals("tester2") && sessionPW.equals("5678"))) {
	session.setAttribute("loginID", sessionID);
	response.sendRedirect("login_ok.jsp");
} else {
	response.sendRedirect("login.jsp");
}
%>
<%=sessionID%>
<%=sessionPW%>
