<%@page import="cbq_1234.DBConnector"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sql = "select m.m_no, m.m_name, count(*) as v_total from tbl_member_202005 m, tbl_vote_202005 v ";
sql += " where m.m_no = v.m_no and v.v_confirm = 'Y' ";
sql += " group by m.m_no, m.m_name order by v_total desc ";

ArrayList<HashMap<String, String>> rankList = new ArrayList<HashMap<String, String>>();

try (Connection con = DBConnector.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);) {
	while (rs.next()) {
		HashMap<String, String> rank = new HashMap<>();
		rank.put("m_no", rs.getString("m_no"));
		rank.put("m_name", rs.getString("m_name"));
		rank.put("v_total", rs.getString("v_total"));
		rankList.add(rank);
	}
	System.out.println(rankList.toString());

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표검수조회</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h3>투표검수조회</h3>
		<table>
			<thead>
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>총투표건수</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (HashMap<String, String> rank : rankList) {
				%>
				<tr>
					<td><%=rank.get("m_no")%></td>
					<td><%=rank.get("m_name")%></td>
					<td><%=rank.get("v_total")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>