<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String cookieData = request.getParameter("cookieData"); // 인자를 받아옴
Cookie cookie = new Cookie("cookieTest", cookieData); // 쿠키이름와 인자값으로 새 쿠키 만듦. 
//한번에 하나만 꺼낼수 없고 배열로 다 꺼내와서 찾아야함
cookie.setMaxAge(60 * 60 * 24 * 2); // 1 = 1s
//cookie.setPath("C:\\Users\\MYCOM\\Dropbox\\PC\\Music\\221025\\cookie");
response.addCookie(cookie);
response.sendRedirect("ex01_cookie.jsp");
%>