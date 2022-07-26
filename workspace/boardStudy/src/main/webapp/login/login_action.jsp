<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.User"%>
<%
/*
디비와 상호작용하려면 web-inf/lib 아래에 ojdbc8.jar가 있어야함
아이디 비번이 디비와 일치할시 -> 로그인 세션 
*/

request.setCharacterEncoding("UTF-8"); // 인코딩

String id = request.getParameter("id"); // 아이디 비번 파라미터에서 스트링으로 가져옴
String password = request.getParameter("password");

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null; // 디비에 접속한 결과를 받는 객체

try {
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbname = "c##jsptest";
	String dbpass = "1234"; // 디비정보

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, dbname, dbpass); // 디비정보로 연결

	String sqlold = "select * from usertb where id=" + id + " and password=" + password;
	String sql = "select * from usertb where id=? and password=?"; // 동적쿼리

	psmt = conn.prepareStatement(sql);
	psmt.setString(1, id); // (n번째물음표,변수)
	psmt.setString(2, password);

	rs = psmt.executeQuery();
	// 결과가 없는것들은 executeUpdate()를 이용해 실행, 결과를 받아와야되면 executeQuery 사용후 rs에 담기

	// 	String loginId = null;
	// 	String loginName = null;
	// 	String loginPassword = null;
	// 	String loginAddr = null;
	// 	int uidx = 0;
	if (rs.next()) {
		//쿼리실행의 결과가 존재
		User user = new User(); // session에 담길 loginUser 객체

		user.setId(rs.getString("id")); // 객체에다가 rs로 꺼내온 결과를 담음
		user.setName(rs.getString("name"));
		user.setUidx(rs.getInt("uidx"));

		session.setAttribute("login", user); // login이라는 이름의 세션으로 user객체를 집어넣음 (id,name,uidx)

		response.sendRedirect(request.getContextPath());

		// 		loginId = rs.getString("id"); // db의 컬럼명을 입력
		// 		loginName = rs.getString("name");
		// 		loginPassword = rs.getString("password");
		// 		loginAddr = rs.getString("addr");
		// 		uidx = rs.getInt("uidx");

		//     session.setAttribute("loginId",loginId); //좌측 세션이름, 우측 변수에서 값을 가져와 집어넣음
		//     session.setAttribute("loginName",loginName);
		//     session.setAttribute("uidx",uidx);
	} else {
		//데이터 없음
%>
<script>
	alert("아이디/비밀번호가 틀렸습니다.");
	location.href = "<%request.getContextPath();%>
	/boardStudy/login/login.jsp";
</script>
<%
}

} catch (Exception e) {
e.printStackTrace();
} finally { // 작업 후 사용한 연결을 종료해야함
if (conn != null) {
conn.close();
}
if (psmt != null) {
psmt.close();
}
if (rs != null) {
rs.close();
}
}
%>