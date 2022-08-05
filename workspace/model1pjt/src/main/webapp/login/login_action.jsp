<%@page import="model1pjt.dao.UserDAO"%>
<%@page import="model1pjt.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
UserDAO userDAO = new UserDAO();
%>
<jsp:useBean id="userLogin" class="model1pjt.dto.User" scope="request" />
<jsp:setProperty name="userLogin" property="*" />
<%
User result = userDAO.loginAction(userLogin);

System.out.println("action : " + result.getId());
System.out.println("action : " + result.getName());
if (result != null) {
	response.sendRedirect(request.getContextPath());
	session.setAttribute("loginSession", result);
} else {
	response.sendRedirect(request.getContextPath() + "/login/login.jsp");
}
%>