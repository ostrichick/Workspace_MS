<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="boardStudy.User"%><%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<%
Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;

User user = new User();
User login = (User) session.getAttribute("login");
String prompt = request.getParameter("password");

try {
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String dbName = "c##jsptest";
	String dbPass = "1234";

	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, dbName, dbPass);

	String sql = "select * from usertb where uidx=? and password=?";
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, login.getUidx());
	psmt.setString(2, prompt);

	rs = psmt.executeQuery();

	if (rs.next()) {
		user.setUidx(rs.getInt("uidx"));
		user.setId(rs.getString("id"));
		user.setName(rs.getString("name"));
		user.setAddr(rs.getString("addr"));
		user.setPassword(rs.getString("password"));
	} else { //불일치
%>
<script>alert("입력한 비밀번호가 일치하지 않습니다");location.href="<%=request.getContextPath()%>/index.jsp";
</script>
<%
//response.sendRedirect(request.getContextPath());
}
} catch (Exception e) {
e.printStackTrace();
} finally {
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

<!-- 사용자가 입력한 비밀번호가 현재 로그인한 유저의 비밀번호가 아니면
비밀번호가 일치 하지 않습니다 경고창 출력 후 index.jsp로 리다이렉트 

1.전달받은 파라미터 password 찾아오기
2.로그인한 user객체 찾아오기
3. db에서 로그인한 user객체 uidx값과 사용자가 입력한 password를 가진 user가 존재하는지 조회
4. 존재한다면 상세데이터 출력
5. 존재하지 않는다면 index.jsp
-->


<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <form action="">
      <table>
        <tr>
          <th align="right">아이디</th>
          <td><%=user.getId()%></td>
        </tr>
        <tr>
          <th align="right">이름</th>
          <td>
            <input type="text" value="<%=user.getName()%>" name="name" />
          </td>
        </tr>
        <tr>
          <th align="right">비밀번호</th>
          <td>
            <input type="password" name="password" />
          </td>
        </tr>
        <tr>
          <th align="right">주소</th>
          <td>
            <input type="text" value="<%=user.getAddr()%>" name="addr" />
          </td>
        </tr>
        <tr>
          <th align="right">회원번호</th>
          <td><%=user.getUidx()%></td>
        </tr>
        <tr>
          <td>
            <input type="submit" value="전송" />
          </td>
        </tr>
      </table>
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>