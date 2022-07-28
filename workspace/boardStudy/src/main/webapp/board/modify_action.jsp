<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.User"%>
<%
// db와 통신에 사용하는 sql.*과, DB연결에 사용하는 절차를 담아놓은 DBconnector 클래스, 세션에 사용할 User 클래스 임포트 
request.setCharacterEncoding("UTF-8"); //파라미터 한글로 주고받을땐 인코딩 세팅
String title = request.getParameter("title"); // edit 페이지에서 파라미터로 받은 정보를 하나씩 담기
String content = request.getParameter("content");
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

	String sql = "UPDATE BOARDTB SET TITLE=?, CONTENT=? WHERE BIDX=?"; // bidx가 일치하는 게시물의 정보 수정
	psmt = conn.prepareStatement(sql); // 쿼리문 보낼 준비
	psmt.setString(1, title); // 쿼리문 ?에 파라미터로 받아온 정보를 하나씩 집어넣기
	psmt.setString(2, content);
	psmt.setInt(3, bidx);

	int result = psmt.executeUpdate(); // 업데이트시 변경됐으면 1, 안 됐으면 0 반환
	if (result > 0) {
		//잘 수정됨
		response.sendRedirect(request.getContextPath() + "/board/view.jsp?bidx=" + bidx); //리다이렉트
	} else {
		//수정 안 됨
%>
<script>
alert("수정에 실패했습니다. <%=result%>"); //경고문
location.href="<%=request.getContextPath()%>/board/view.jsp?bidx=" + bidx;
</script>
<%
}
} catch (Exception e) {
e.printStackTrace(); // 예외처리
} finally {
dbConnector.connClose(); //연결 끊기
if (psmt != null) {
psmt.close();
}
}
%>