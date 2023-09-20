<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connector.DBConnector"%>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

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

String sql = "INSERT INTO member_tbl_02 (custno, custname, phone, address, joindate, grade, city) VALUES (";
sql += "?, ?, ?, ?, to_date(?,'yyyymmdd'), ?, ?)";

try (Connection conn = DBConnector.getConnection(); PreparedStatement psmt = conn.prepareStatement(sql);) {
	psmt.setInt(1, custno);
	psmt.setString(2, custname);
	psmt.setString(3, phone);
	psmt.setString(4, address);
	psmt.setString(5, joindate);
	psmt.setString(6, grade);
	psmt.setString(7, city);

	int result = psmt.executeUpdate();

	if (result != 0) {
		out.println("<script> alert('회원가입 성공!!!');location.href='home.jsp'</script>");
		//response.sendRedirect("home.jsp");
	} else {
		out.println("<script> alert('회원가입 실패!!!');location.href='join.jsp'</script>");
	}
} catch (Exception e) {
	e.printStackTrace();
}
%>