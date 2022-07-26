<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.User"%>
<%
request.setCharacterEncoding("UTF-8"); // 한글을 주고받을때 인코딩
String title = request.getParameter("title"); // 쓰기 페이지에서 제목과 내용 가져와서 스트링에 저장
String content = request.getParameter("content");

User login = (User) session.getAttribute("login"); // 세션 불러오기
int uidx = login.getUidx(); // 세션에서 uidx 가져옴. 처리를 하는 곳에서 가져오는 것이 안전함

Connection conn = null;
PreparedStatement psmt = null;
DBConnector dbConnector = new DBConnector(); //db와 연결
try {
		conn = dbConnector.getConnection();

	String sql = "insert into boardtb(bidx, title, content, uidx) VALUES (bidx_seq.nextval, ?, ?, ?)";
	// wdate 컬럼은 기본값이 있으므로 여기에서 안 넣어도 됨
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, title); // 쿼리문에 ?를 하나씩 채우기
	psmt.setString(2, content);
	psmt.setInt(3, uidx);

	int result = psmt.executeUpdate(); // 업데이트 성공했으면 1반환?

	if (result > 0) { // 업뎃 성공하면 팝업띄우기
		System.out.println(result); // 1 출력
%>
<script>
  alert("업로드 완료"); // 작동안됨
</script>
<%
} else {
%>
<script>
  alert("업로드 실패"); // 작동안됨
</script>
<%
}
response.sendRedirect("list.jsp"); // 목록으로 리다리엑트
} catch (Exception e) {
e.printStackTrace(); // 예외처리
} finally {
dbConnector.connClose(); // 연결끊기
if (psmt != null) {
psmt.close();
}
}
%>