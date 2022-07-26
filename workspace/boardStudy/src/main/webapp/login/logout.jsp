<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.invalidate(); // 하나씩 removeAttribute 하는 대신 모든 세션을 한번에 다 종료할 수 있음
response.sendRedirect(request.getContextPath());
%>