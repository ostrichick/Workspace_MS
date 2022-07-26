<%@page import="java.security.spec.RSAKeyGenParameterSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="boardStudy.User"%>
<%
User login = (User) session.getAttribute("login");
if (login == null) {
%><!DOCTYPE html>
<html>
<head>
<script> 
alert("로그인 후 이용할 수 있는 페이지입니다");
   location.href="<%request.getContextPath();%> 
 /login/login.jsp";
 </script>
<%
}

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;

User user = new User();

try {
String url = "jdbc:oracle:thin:@localhost:1521:xe";
String dbName = "c##jsptest";
String dbPass = "1234";

Class.forName("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection(url, dbName, dbPass);

String sql = "select * from usertb where uidx=?";
psmt = conn.prepareStatement(sql);
psmt.setInt(1, login.getUidx());

rs = psmt.executeQuery();

if (rs.next()) {
	user.setUidx(rs.getInt("uidx"));
	user.setId(rs.getString("id"));
	user.setName(rs.getString("name"));
	user.setAddr(rs.getString("addr"));
	user.setPassword(rs.getString("password"));
}
} catch (Exception e) {
e.printStackTrace();
} finally {
if (conn != null) {
	conn.close();
}
if (psmt != null) {
	psmt.close();
}
if (rs != null) {
	rs.close();
}
}
%>

<meta charset="UTF-8">
<title>마이 페이지</title>
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
  <section>
    <p>마이페이지</p>
    <table>
      <tr>
        <th align="right">아이디</th>
        <td><%=user.getId()%></td>
      </tr>
      <tr>
        <th align="right">이름</th>
        <td><%=user.getName()%></td>
      </tr>
      <tr>
        <th align="right">비밀번호</th>
        <td><%=user.getPassword()%></td>
      </tr>
      <tr>
        <th align="right">주소</th>
        <td><%=user.getAddr()%></td>
      </tr>
      <tr>
        <th align="right">회원번호</th>
        <td><%=user.getUidx()%></td>
      </tr>
    </table>
    <button onclick="modifyCall()">회원정보 수정</button>
  </section>
  <%@include file="/include/footer.jsp"%>
  <script>
			function modifyCall() {
				var pass = prompt("비밀번호를 입력하세요");
        location.href = "modify.jsp?password=" + pass;
			}
		</script>
  
</body>
</html>