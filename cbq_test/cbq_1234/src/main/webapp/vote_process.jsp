<%@page import="cbq_1234.DBConnector"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String m_jumin = request.getParameter("m_jumin");
String m_name = request.getParameter("m_name");
String m_no = request.getParameter("m_no");
String v_time = request.getParameter("v_time");
String v_area = request.getParameter("v_area");
String v_confirm = request.getParameter("v_confirm");

String sql = " INSERT INTO TBL_VOTE_202005 VALUES";
sql += "(?, ?, ?, ?, ?, ?)";
int result = 0;
try (Connection con = DBConnector.getConnection(); PreparedStatement pstmt = con.prepareStatement(sql);) {
	pstmt.setString(1, m_jumin);
	pstmt.setString(2, m_name);
	pstmt.setString(3, m_no);
	pstmt.setString(4, v_time);
	pstmt.setString(5, v_area);
	pstmt.setString(6, v_confirm);

	result = pstmt.executeUpdate();

	System.out.println("result is : " + result);
	if (result > 0) {
		out.println("<script>alert('투표하기 정보가 정상적으로 등록 되었습니다!');location.href='index.jsp';</script>");
	} else {
		out.println("<script>alert('투표하기 정보가 등록되지 않았습니다!');location.href='index.jsp';</script>");
	}

} catch (Exception e) {
	e.printStackTrace();
}
%>