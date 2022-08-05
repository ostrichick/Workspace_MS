<%@page import="model1pjt.dao.UserDAO"%>
<%@page import="model1pjt.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
<jsp:useBean id="joinMember" class="model1pjt.dto.User" scope="request" />
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:setProperty name="joinMember" property="*" />
<%
User joinMember2 = (User) request.getAttribute("joinMember");
out.println(joinMember.getId());
out.println(joinMember2.getId());

UserDAO userDAO = new UserDAO();
int result = userDAO.insertUser(joinMember);
if (result > 0) {
	response.sendRedirect(request.getContextPath());
} else {
	response.sendRedirect(request.getContextPath() + "/login/joinMember.jsp");
}
%>