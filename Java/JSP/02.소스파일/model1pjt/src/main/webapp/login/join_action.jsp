<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model1pjt.dto.User" %>
<%@ page import="model1pjt.dao.UserDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="joinMember" class="model1pjt.dto.User" scope="request" />
<jsp:setProperty name="joinMember" property="*"/>
<%
	
	User joinMember2 = (User)request.getAttribute("joinMember");
	
	out.print(joinMember.getId());
	out.print(joinMember2.getId());
	
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.insertUser(joinMember);
	
	if(result > 0){
		response.sendRedirect(request.getContextPath());
	}else{
		response.sendRedirect(request.getContextPath()+"/login/join.jsp");
	}
	
	

%>




