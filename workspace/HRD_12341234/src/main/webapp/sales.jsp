<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// String sql = "SELECT s.custno, m.custname, m.grade, SUM(s.price) as sale FROM money_tbl_02 s";
// sql += "INNER JOIN member_tbl_02 m";
// sql += "ON s.custno = m.custno";
// sql += "GROUP BY s.custno, m.custname, m.grade";
// sql += "ORDER BY SUM(s.price) desc";

String sql = "SELECT s.custno, m.custname, m.grade, SUM(s.price) as sale FROM money_tbl_02 s ";
sql += " INNER JOIN member_tbl_02 m ON s.custno = m.custno ";
sql += " GROUP BY s.custno, m.custname, m.grade ";
sql += " ORDER BY SUM(s.price) DESC ";

ArrayList<HashMap<String, String>> salelist = new ArrayList<HashMap<String, String>>();
try (Connection conn = DBConnector.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {
	try (ResultSet rs = psmt.executeQuery();) {
		while (rs.next()) {
	HashMap<String, String> sale = new HashMap<String, String>();
	sale.put("custno", rs.getString("custno"));
	sale.put("custname", rs.getString("custname"));
	sale.put("grade", rs.getString("grade"));
	sale.put("sale", rs.getString("sale"));

	salelist.add(sale);
		}
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원매출조회</title>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <h3 style="margin: auto; text-align: center;">회원매출조회</h3>
    <table style="margin: auto; text-align: center">
      <thead>
        <tr>
          <th>회원번호</th>
          <th>회원성명</th>
          <th>고객등급</th>
          <th>매출</th>
        </tr>
        <%
        for (HashMap<String, String> member : salelist) {
        %>
        <tr>
          <td><%=member.get("custno")%></td>
          <td><%=member.get("custname")%></td>
          <td>
            <%
            String grade = null;
            switch (member.get("grade")) {
            case "A":
            	grade = "VIP";
            	break;
            case "B":
            	grade = "일반";
            	break;
            case "C":
            	grade = "직원";
            	break;
            default:
            	grade = "등급 지정 오류";
            }
            %>
            <%=grade%>
          </td>
          <td><%=member.get("sale")%></td>
        </tr>
        <%
        }
        %>
      </thead>
    </table>
  </section>
  <%@include file="include/footer.jsp"%>
</body>
</html>