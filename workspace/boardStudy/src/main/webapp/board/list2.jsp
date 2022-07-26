<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%>
<%
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
DBConnector dbConnector = new DBConnector();

try {
	conn = dbConnector.getConnection();
	String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx";
	psmt = conn.prepareStatement(sql);

	rs = psmt.executeQuery(); // rs 안에는
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

table {
  border: 1px grey solid;
  width: 800px;
}

th, td, tr {
  border: 1px grey solid;
}

th {
  width: 180px;
}

th:first-child {
  width: 50px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <h2>게시글 목록 페이지</h2>
    <table>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
      </tr>
      <%
      while (rs.next()) { // rs
      %>
      <tr>
        <td><%=rs.getInt("bidx")%></td>
        <td><%=rs.getString("title")%></td>
        <td><%=rs.getString("name")%></td>
        <td><%=rs.getString("wdate")%></td>
      </tr>
      <%
      }
      } catch (Exception e) {
      e.printStackTrace();
      } finally {
      dbConnector.connClose();
      if (psmt != null) {
      psmt.close();
      }
      if (rs != null) {
      rs.close();
      }
      }
      %>
<!--       <tr> -->
<!--         <td colspan="4">등록된 게시글이 없습니다</td> -->
<!--       </tr> -->
    </table>
    <button onclick="location.href='insert.jsp'">등록</button>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>