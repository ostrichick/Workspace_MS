<%@page import="cbq_1234.DBConnector"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String sql = "select * from tbl_vote_202005 where v_area = '제1투표장' ";

ArrayList<HashMap<String, String>> voteList = new ArrayList<HashMap<String, String>>();

try (Connection con = DBConnector.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);) {
	while (rs.next()) {
		HashMap<String, String> vote = new HashMap<>();

		vote.put("v_name", rs.getString("v_name"));

		String birth_year = rs.getString("v_jumin").substring(0, 2);
		if (Integer.parseInt(birth_year) < 2) {
	birth_year = "20" + birth_year;
		} else {
	birth_year = "19" + birth_year;
		}
		String birth_month = rs.getString("v_jumin").substring(2, 4);
		String birth_day = rs.getString("v_jumin").substring(4, 6);
		String birthday = birth_year + "년" + birth_month + "월" + birth_day + "일생";
		vote.put("birthday", birthday);

		int age = 0;
		int yy = Integer.parseInt(birth_year);
		age = 2022 - yy;
		System.out.println(age);
		vote.put("age", Integer.toString(age) + "세");

		String gender = "";
		switch (rs.getString("v_jumin").substring(6, 7)) {
		case "1":
		case "3":
	gender = "남";
	break;
		case "2":
		case "4":
	gender = "여";
	break;
		default:
	gender = "성별코드오류";
	break;
		}
		vote.put("gender", gender);
		vote.put("m_no", rs.getString("m_no"));

		vote.put("v_time", rs.getString("v_time").substring(0, 2) + ":" + rs.getString("v_time").substring(2, 4));
		vote.put("v_confirm", rs.getString("v_confirm"));

		voteList.add(vote);
	}
	System.out.println(voteList.toString());

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
					<th>성명</th>
					<th>생년월일</th>
					<th>나이</th>
					<th>성별</th>
					<th>후보번호</th>
					<th>투표시간</th>
					<th>유권자확인</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (HashMap<String, String> vote : voteList) {
				%>
				<tr>
					<td><%=vote.get("v_name")%></td>
					<td><%=vote.get("birthday")%></td>
					<td><%=vote.get("age")%></td>
					<td><%=vote.get("gender")%></td>
					<td><%=vote.get("m_no")%></td>
					<td><%=vote.get("v_time")%></td>
					<td><%=vote.get("v_confirm")%></td>
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