<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="java.util.ArrayList"%>
<%@ page import="boardStudy.User"%>
<%
request.setCharacterEncoding("UTF-8");
String searchType = request.getParameter("searchType");
String searchValue = request.getParameter("searchValue");

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null;
DBConnector dbConnector = new DBConnector(); // db와 연결할 때 쓰는 껍데기객체생성

ArrayList<User> ulist = new ArrayList<>(); // db에서 받아온 정보를 담아놓을 ArrayList 객체 생성

try {
	conn = dbConnector.getConnection();
	String sql = "select * from usertb";

	if (searchType != null) { //null이 아니면 검색할게 존재함
		// 		if (searchType.equals("uidx")) {
		// 	sql += " where uidx like '%'||?||'%'"; // 맨 앞에 공백을 넣어야 sql에서 붙어져 인식돼는 오류가 안 남
		// 		} else 
		if (searchType.equals("id")) { // 작성자로 검색할 경우
	sql += " where id like '%'||?||'%'"; // sql 구문 콘캣기호 ||를 이용해서 문자열을 합쳐야함
		} else if (searchType.equals("name")) {
	sql += " where name like '%'||?||'%'";
		}
		//     else if (searchType.equals("addr")) {
		// 	sql += " where addr like '%'||?||'%'";
		// 		}
	}
	psmt = conn.prepareStatement(sql);
	if (searchType != null) {
		psmt.setString(1, searchValue);
	}
	rs = psmt.executeQuery();

	while (rs.next()) { // rs 객체 안에 다음 원소가 있는한 계속 반복
		User user = new User(); // board 객체 생성
		user.setUidx(rs.getInt("uidx"));
		user.setId(rs.getString("id"));
		user.setName(rs.getString("name"));
		user.setAddr(rs.getString("addr")); // board 객체에 db에서 rs로 얻은 결과 집어넣기
		ulist.add(user); // 정보를 다 집어넣은 board 객체를 ArrayList 배열에 집어넣기
	}

} catch (Exception e) {
	e.printStackTrace();
} finally {
	dbConnector.connClose();
	if (psmt != null) {
		psmt.close();
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}

table, th, td, tr {
  border: 1px black solid;
  border-collapse: collapse;
  padding: 10px;
}

table {
  width: 600px;
  margin: 30px auto;
}

table div {
  min-height: 150px;
}

.searchArea {
  margin: 20px auto;
  text-align: center;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <div class="searchArea">
      <form action="list.jsp" method="get">
        <select name="searchType" id="">
<%--           <option value="uidx" <%if (searchType != null && searchType.equals("uidx")) --%>
<%-- 	out.print("selected");%>>회원번호</option> --%>
          <option value="id" <%if (searchType != null && searchType.equals("id"))
	out.print("selected");%>>아이디</option>
          <option value="name" <%if (searchType != null && searchType.equals("name"))
	out.print("selected");%>>이름</option>
<%--           <option value="addr" <%if (searchType != null && searchType.equals("addr")) --%>
<%-- 	out.print("selected");%>>주소</option> --%>
        </select>
        <input type="text" name="searchValue" value="<%if (searchValue != null && !searchValue.equals(""))
	out.print(searchValue);%>" />
        <input type="submit" value="검색" />
      </form>
    </div>
    <table>
      <tr>
        <th>회원번호</th>
        <th>아이디</th>
        <th>이름</th>
        <th>주소</th>
      </tr>
      <%
      for (User temp : ulist) { // 배열에 집어넣은 게시판 정보를 반복문으로 하나씩 꺼내서 html태그에 집어넣기
      %>
      <tr>
        <td><%=temp.getUidx()%></td>
        <td><%=temp.getId()%></td>
        <td><%=temp.getName()%></td>
        <td><%=temp.getAddr()%></td>
      </tr>
      <%
      }
      %>
    </table>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>