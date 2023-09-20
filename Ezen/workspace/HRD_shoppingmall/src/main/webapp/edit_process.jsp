
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.DBConnector"%>
<%
request.setCharacterEncoding("UTF-8");

String custno_String = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

int custno = 0;
if (custno_String != null && custno_String != "") {
	custno = Integer.parseInt(custno_String);
}

String sql = "UPDATE member_tbl_02 set ";
sql += "custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? ";
sql += "where custno = ?";

try (Connection conn = DBConnector.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {
	psmt.setInt(7, custno);
	psmt.setString(1, custname);
	psmt.setString(2, phone);
	psmt.setString(3, address);
	psmt.setString(4, joindate);
	psmt.setString(5, grade);
	psmt.setString(6, city);

	int result = psmt.executeUpdate();

	if (result != 0) {
		response.sendRedirect("home.jsp");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>