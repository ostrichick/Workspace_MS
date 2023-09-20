<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <c:set var="date" value="<%=new Date()%>" />
  <br> 기본값:
  <fmt:formatDate value="${date}" />
  <br> 날짜:
  <fmt:formatDate value="${date}" type="date" />
  <br> 시간:
  <fmt:formatDate value="${date}" type="time" />
  <br> 둘 다:
  <fmt:formatDate value="${date}" type="both" />
  <br> 커스텀패턴:
  <fmt:formatDate value="${date}" type="both" pattern="yyyy년 MM월 dd일 aa hh시 mm분 ss초" />
  <hr />
  <fmt:formatNumber value="328947239847.234234" pattern="##,###.##"/>
</body>
</html>