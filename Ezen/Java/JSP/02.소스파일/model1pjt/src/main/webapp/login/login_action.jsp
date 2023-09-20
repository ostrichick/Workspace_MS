<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1pjt.dao.UserDAO" %>
<%@ page import="model1pjt.dto.User" %>       
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="loginInfo" class="model1pjt.dto.User" scope="request"/>
<jsp:setProperty property="*" name="loginInfo"/>
<%
	
	UserDAO userDAO = new UserDAO();
	User result = userDAO.selectByLogin(loginInfo);
	
	if(result != null){
		session.setAttribute("login",result);
		response.sendRedirect(request.getContextPath());
	}else{
		response.sendRedirect(request.getContextPath()+"/login/login.jsp");
	}
	

%>