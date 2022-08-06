<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="date" value="<%=new Date() %>"/>
오늘 날짜 : <fmt:formatDate value="${date}"/>
<br>
시간 : <fmt:formatDate value="${date}" type="time"/>
<br>
yyyy-mm-dd : <fmt:formatDate value="${date}" type="date" pattern="yyyy-MM-dd" />
<br>
hh:mm:ss : <fmt:formatDate value="${date }" type="time" pattern="hh:mm:ss"/>


<fmt:formatNumber value="10000000" pattern="#,###"/>

</body>
</html>








