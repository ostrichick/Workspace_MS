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
String sql = "select * from member_tbl_02";
ArrayList<HashMap<String, String>> memberlist = new ArrayList<HashMap<String, String>>();
try (Connection conn = DBConnector.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {
	try (ResultSet rs = psmt.executeQuery();) {
		while (rs.next()) {
	HashMap<String, String> member = new HashMap<String, String>();
	member.put("custno", rs.getString("custno"));
	member.put("custname", rs.getString("custname"));
	member.put("phone", rs.getString("phone"));
	member.put("address", rs.getString("address"));
	member.put("joindate", rs.getString("joindate"));
	member.put("grade", rs.getString("grade"));
	member.put("city", rs.getString("city"));
	memberlist.add(member);
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
<title>회원목록조회/수정</title>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <h3 style="margin: auto; text-align: center;">회원목록조회/수정</h3>
    <table style="margin: auto; text-align: center">
      <thead>
        <tr>
          <th>회원번호</th>
          <th>회원성명</th>
          <th>전화번호</th>
          <th>주소</th>
          <th>가입일자</th>
          <th>고객등급</th>
          <th>거주지역</th>
        </tr>
        <%
        for (HashMap<String, String> member : memberlist) {
        %>
        <tr>
          <td>
            <a href="edit.jsp?custno=<%=member.get("custno")%>"><%=member.get("custno")%></a>
          </td>
          <td><%=member.get("custname")%></td>
          <td><%=member.get("phone")%></td>
          <td><%=member.get("address")%></td>
          <td><%=member.get("joindate").substring(0, 10)%></td>
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
            }
            %>
            <%=grade%>
          </td>
          <td><%=member.get("city")%></td>
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