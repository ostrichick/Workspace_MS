<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL core 라이브러리:기타</title>
</head>
<body>

<h2>JSTL core 라이브러리:url, redirect</h2>

<c:url var="naver" value="https://www.naver.com" />
<a href="${naver}">네이버</a>

<%-- <c:redirect url="${naver}"/> --%>
</body>
</html>