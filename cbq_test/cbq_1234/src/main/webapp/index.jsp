<%@page import="cbq_1234.DBConnector"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sql = "select sysdate from dual";
try (Connection con = DBConnector.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);) {
	/*
	if (con != null) {
		out.println("success!");
	}
	*/
	/*
	else {
		out.println("fail");
	}
	*/
	/*
	while (rs.next()) {
		out.println("Today " + rs.getString(1) + "<hr>");
	}
	*/
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구 투표 프로그램</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>첫 화면입니다</section>
	<%@include file="footer.jsp"%>
</body>
</html>