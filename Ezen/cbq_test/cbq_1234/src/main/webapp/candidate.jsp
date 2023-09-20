<%@page import="cbq_1234.DBConnector"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sql = "select m.m_no, m.m_name, m.p_code, m.p_school, m.m_jumin, m.m_city, p.p_tel1, p.p_tel2, p.p_tel3  from tbl_member_202005 m ";
sql += " inner join tbl_party_202005 p ";
sql += " on m.p_code = p.p_code order by m.m_no ";
ArrayList<HashMap<String, String>> candidateList = new ArrayList<HashMap<String, String>>();

try (Connection con = DBConnector.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);) {
	while (rs.next()) {
		HashMap<String, String> candidate = new HashMap<>();
		candidate.put("m_no", rs.getString("m_no"));
		candidate.put("m_name", rs.getString("m_name"));
		String p_code = "";
		System.out.println(rs.getString("p_code"));
		switch (rs.getString("p_code")) {
		case "P1":
	p_code = "A정당";
	break;
		case "P2":
	p_code = "B정당";
	break;
		case "P3":
	p_code = "C정당";
	break;
		case "P4":
	p_code = "D정당";
	break;
		case "P5":
	p_code = "E정당";
	break;
		default:
	p_code = "정당코드오류";
	break;
		}
		System.out.println(p_code);

		candidate.put("p_code", p_code);
		String p_school = "";

		switch (rs.getString("p_school")) {
		case "1":
	p_school = "고졸";
	break;
		case "2":
	p_school = "학사";
	break;
		case "3":
	p_school = "석사";
	break;
		case "4":
	p_school = "박사";
	break;
		default:
	p_school = "학력코드 오류";
	break;
		}

		String m_jumin1 = rs.getString("m_jumin").substring(0, 6);
		String m_jumin2 = rs.getString("m_jumin").substring(6);
		String m_jumin = m_jumin1 + "-" + m_jumin2;
		candidate.put("p_school", p_school);
		candidate.put("m_jumin", m_jumin);
		candidate.put("m_city", rs.getString("m_city"));
		candidate.put("p_tel1", rs.getString("p_tel1"));
		candidate.put("p_tel2", rs.getString("p_tel2"));
		candidate.put("p_tel3", rs.getString("p_tel3"));
		candidateList.add(candidate);
	}
	System.out.println(candidateList.toString());

} catch (Exception e) {
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후보조회</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h3>후보조회</h3>
		<table>
			<thead>
				<tr>
					<th>후보번호</th>
					<th>성명</th>
					<th>소속정당</th>
					<th>학력</th>
					<th>주민번호</th>
					<th>지역구</th>
					<th>대표전화</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (HashMap<String, String> candidate : candidateList) {
				%>
				<tr>
					<td><%=candidate.get("m_no")%></td>
					<td><%=candidate.get("m_name")%></td>
					<td><%=candidate.get("p_code")%></td>
					<td><%=candidate.get("p_school")%></td>
					<td><%=candidate.get("m_jumin")%></td>
					<td><%=candidate.get("m_city")%></td>
					<td><%=candidate.get("p_tel1").substring(0, 2) + "-" + candidate.get("p_tel2") + "-" + candidate.get("p_tel3")%></td>
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