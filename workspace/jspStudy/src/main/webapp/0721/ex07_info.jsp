<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<%
// request.getRequestDispatcher("ex07_forward.jsp").forward(request, response); // 포워드 - 데이터유지, 다른 주소로 보임
response.sendRedirect("ex07_forward.jsp"); // 리다이렉트 - 데이터 잃음
%>