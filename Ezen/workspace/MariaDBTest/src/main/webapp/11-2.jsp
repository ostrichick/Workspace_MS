<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select 구문 예제</title>
</head>
<body>
  <table border="1">
    <tr>
      <th>아이디</th>
      <th>비밀번호</th>
      <th>이름</th>
      <th>전화번호</th>
      <th>주소</th>
    </tr>
    <%
    Class.forName("org.mariadb.jdbc.Driver");
    String url = "jdbc:mariadb://localhost:3305/my_db";
    String user = "user";
    String pw = "1234";
    try (Connection con = DriverManager.getConnection(url, user, pw);
    		Statement stmt = con.createStatement();
    		ResultSet rs = stmt.executeQuery("select * from member");) {
    	while (rs.next()) {
    		out.print("<tr><td>" + rs.getInt("id") + "</td>");
    		out.print("<td>" + rs.getString("pass") + "</td>");
    		out.print("<td>" + rs.getString("name") + "</td>");
    		out.print("<td>" + rs.getString("phone") + "</td>");
    		out.print("<td>" + rs.getString("address") + "</td></tr>");
    	}
    } catch (Exception e) {
    	out.println("연결 실패");
    	e.printStackTrace();
    }
    %>
  </table>
</body>
</html>