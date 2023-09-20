<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 날자와 시간을 출력하는 페이지</title>
</head>
<body>

  현재 날자와 시간은
  <%
SimpleDateFormat sdt = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
Date date = new Date();
out.print(sdt.format(date));
%>
  입니다.
</body>
</html>