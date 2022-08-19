<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>${memberList}

	<c:forEach items="${memberList }" var="memberVo"> 
<br>${memberVo.member_id }<br>${memberVo.member_pw }
</c:forEach>
</body>
</html>