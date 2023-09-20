<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%>
<%
Connection conn = null;
PreparedStatement psmt = null;
DBConnector dbConnector = new DBConnector(); // db와 연결할 때 쓰는 껍데기객체생성

try {
  conn = dbConnector.getConnection(); 
  String sql = ""; 
  psmt = conn.prepareStatement(sql); 
  psmt.setString(1, "입력"); 

  int result = psmt.executeUpdate(); 
} catch (Exception e) {
e.printStackTrace(); 
} finally {
dbConnector.connClose(); 
if (psmt != null) {
psmt.close();
}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section></section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>