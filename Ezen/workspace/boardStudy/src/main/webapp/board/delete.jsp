<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%>
<%
// db와 통신에 사용하는 sql.*과, DB연결에 사용하는 절차를 담아놓은 DBconnector 클래스, 세션에 사용할 User 클래스 임포트 
request.setCharacterEncoding("UTF-8"); //파라미터 한글로 주고받을땐 인코딩 세팅
String bidxStr = request.getParameter("bidx"); // 바로 형변환하면 에러가 날수있으니 널체크부터
int bidx = 0;
if (bidxStr != null) {
	bidx = Integer.parseInt(bidxStr); // null이 아닐 경우 int로 변환해서 담아줌
}
Connection conn = null;
PreparedStatement psmt = null;
DBConnector dbConnector = new DBConnector(); // db와 연결할 때 쓰는 껍데기객체생성

try {
	conn = dbConnector.getConnection(); // db와 연결

	String sql = "DELETE FROM boardtb WHERE bidx=?"; // bidx가 일치하는 게시물 삭제
	psmt = conn.prepareStatement(sql); // 쿼리문 보낼 준비
	psmt.setInt(1, bidx);
	psmt.executeUpdate();
	// 	 -> INSERT / DELETE / UPDATE 관련 구문에서는 반영된 레코드의 건수를 반환합니다.
	// 	 -> CREATE / DROP 관련 구문에서는 -1 을 반환합니다.
	response.sendRedirect(request.getContextPath() + "/board/list.jsp"); //리다이렉트
} catch (Exception e) {
	e.printStackTrace(); // 예외처리
} finally {
	dbConnector.connClose(); //연결 끊기
	if (psmt != null) {
		psmt.close();
	}
}
%>