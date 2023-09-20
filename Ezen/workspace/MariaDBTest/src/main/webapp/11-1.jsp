<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MariaDB 연결 예제</title>
</head>
<body>
  <%
  Class.forName("org.mariadb.jdbc.Driver");
  String url = "jdbc:mariadb://localhost:3305/my_db";
  String user = "user";
  String pw = "1234";
  try (Connection con = DriverManager.getConnection(url, user, pw)) {
  	out.println("MariaDB 연결 성공");
  } catch (Exception e) {
  	out.println("연결 실패");
  	e.printStackTrace();
  } 
  %>
</body>
</html>