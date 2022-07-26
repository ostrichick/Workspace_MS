<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.User" %>
<%
// db와 통신에 사용하는 sql.*과 통신하는 명령어를 직접담은 디비커넥터 클래스, 세션에 사용할 유저클래스 임포트 


request.setCharacterEncoding("UTF-8"); //파라미터 한글로 주고받을땐 인코딩 세팅
String name = request.getParameter("name"); //수정페이지에서 파라미터로 받은 정보를 하나씩 담기
String password = request.getParameter("password");
String addr = request.getParameter("addr"); 
String uidxStr = request.getParameter("uidx"); // 바로 형변환하면 에러가 날수있으니 널체크부터
int uidx = 0;
if (uidxStr != null) {
	uidx = Integer.parseInt(uidxStr); // 널이 아닐 경우 int로 변환해서 담아줌
}

Connection conn = null;
PreparedStatement psmt = null;
DBConnector dbConnector = new DBConnector(); // db연결

try {
	conn = dbConnector.getConnection();

	String sql = "UPDATE USERTB SET NAME=?, PASSWORD=?, ADDR=? WHERE UIDX=?"; // uidx가 똑같은 유저의 정보를 수정할 쿼리문
	psmt = conn.prepareStatement(sql);
	psmt.setString(1, name); // 쿼리문 ?에 파라미터로 받아온 정보를 하나씩 집어넣기
	psmt.setString(2, password);
	psmt.setString(3, addr);
	psmt.setInt(4, uidx);
  
	int result = psmt.executeUpdate(); // 업데이트시 변경됐으면 1, 안 됐으면 0 반환

	if (result > 0) {
		//잘 수정됨
    //세선수정
    User login = (User)session.getAttribute("login"); // 수정완료후 이동하는페이지에서 세션을 사용하고있으므로
    login.setName(name); // 세션의 이름 정보를 업데이트
    session.setAttribute("login", login);
    
		response.sendRedirect(request.getContextPath() + "/login/mypage.jsp"); //리다이렉트
	} else {
		//수정 안 됨
%>
<script>
alert("수정에 실패했습니다. <%=result%>"); //경고문
location.href="<%=request.getContextPath()%>/login/mypage.jsp";
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