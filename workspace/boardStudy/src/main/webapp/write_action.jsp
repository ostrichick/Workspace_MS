<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
String writer = request.getParameter("writer");
String title = request.getParameter("title");
String content = request.getParameter("content");

Connection conn = null; // DB에 연결하는 역할
PreparedStatement psmt = null; // 동적 쿼리 실행 객체

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "c##jsptest";
String pass = "1234";

try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	String sql = "insert into sampletb(sidx, writer, title, content, wdate) values (sidx_seq.nextval, ?, ?, ?, sysdate)";
	psmt = conn.prepareStatement(sql); // sql문을 psmt에 집어넣음
	psmt.setString(1, writer);
	psmt.setString(2, title);
	psmt.setString(3, content);

	int result = psmt.executeUpdate();
	response.sendRedirect(request.getContextPath()); // index로
	System.out.println("성공");
} catch (Exception e) {
	e.printStackTrace();
} finally {
	if (conn != null) {
		conn.close();
	}
	if (psmt != null) {
		psmt.close();
	} // 커넥션 psmt 쓴 후에 닫아줘야함

}
%>