<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%
String sessionData = request.getParameter("sessionData");
session.setAttribute("sessionTest", sessionData);
response.sendRedirect("ex01_session.jsp");
%>