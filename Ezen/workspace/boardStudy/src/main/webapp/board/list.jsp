<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.Board"%>
<%@ page import="java.util.ArrayList"%>
<%
//db와 통신에 사용하는 sql.*과, DB연결에 사용하는 절차를 담아놓은 DBconnector 클래스, 세션에 사용할 User 클래스 임포트 

request.setCharacterEncoding("UTF-8");
String searchType = request.getParameter("searchType");
String searchValue = request.getParameter("searchValue");

String titleSelected = "";
String writerSelected = "";
if (searchType != null) {
	if (searchType.equals("title")) { // 제목으로 검색할 경우
		titleSelected = "selected";
	} else if (searchType.equals("writer")) { // 작성자로 검색할 경우
		writerSelected = "selected";
	}
}

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null; // DB에서 값을 받아오는 경우 ResultSet 객체를 사용함
DBConnector dbConnector = new DBConnector(); // db와 연결에 사용할 껍데기 객체 생성
ArrayList<Board> blist = new ArrayList<>(); // db에서 받아온 정보를 담아놓을 ArrayList 객체 생성

try {
	conn = dbConnector.getConnection(); // 연결
	String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx"; //

	//   System.out.println(searchType);
	//   System.out.println(searchValue);

	if (searchType != null) { //null이 아니면 검색할게 존재함
		if (searchType.equals("title")) { // 제목으로 검색할 경우
	sql += " where b.title like '%'||?||'%'"; // 맨 앞에 공백을 넣어야 sql에서 붙어져 인식돼는 오류가 안 남
		} else if (searchType.equals("writer")) { // 작성자로 검색할 경우
	sql += " where u.name like '%'||?||'%'"; // sql 구문 콘캣기호 ||를 이용해서 문자열을 합쳐야함
		}
	}
	psmt = conn.prepareStatement(sql);

	if (searchType != null) {
		psmt.setString(1, searchValue);
	}

	rs = psmt.executeQuery(); // 쿼리로 받아온걸 rs에 집어넣음. 정보를 받아올땐 executeQuery() 업뎃만할때는 executeUpdate()

	while (rs.next()) { // rs 객체 안에 다음 원소가 있는한 계속 반복
		Board board = new Board(); // board 객체 생성
		board.setBidx(rs.getInt("bidx"));
		board.setTitle(rs.getString("title"));
		board.setName(rs.getString("name"));
		board.setWdate(rs.getString("wdate")); // board 객체에 db에서 rs로 얻은 결과 집어넣기
		board.setHit(rs.getInt("hit"));
		blist.add(board); // 정보를 다 집어넣은 board 객체를 ArrayList 배열에 집어넣기
	}
} catch (Exception e) {
	e.printStackTrace(); // 예외처리
} finally {
	dbConnector.connClose(); // jdbc 연결 닫기
	if (psmt != null) {
		psmt.close();
	}
	if (rs != null) {
		rs.close();
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

table {
  border: 1px grey solid;
  width: 800px;
  border-collapse: collapse;
  margin: auto;
}

th, td, tr {
  border: 1px grey solid;
}

th {
  width: 180px;
}

th:first-child, th:last-child, th:nth-child(3) {
  width: 80px;
}

section h2 {
  text-align: center;
}

.searchArea {
  text-align: center
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <h2>게시글 목록 페이지</h2>
    <div class="searchArea">
      <form action="list.jsp" method="get">
        <select name="searchType" id="">
          <%--           <option value="title" <%=titleSelected%>>제목</option> --%>
          <%--           <option value="writer" <%=writerSelected%>>작성자</option> --%>
          <option value="title" <%if (searchType != null && searchType.equals("title"))
	out.print("selected");%>>제목</option>
          <option value="writer" <%if (searchType != null && searchType.equals("writer"))
	out.print("selected");%>>작성자</option>
        </select>
        <input type="text" name="searchValue" value="<%if (searchValue != null && !searchValue.equals(""))
	out.print(searchValue);%>" />
        <input type="submit" value="검색" />
      </form>
    </div>
    <table>
      <tr>
        <th>글번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
      </tr>
      <%
      for (Board temp : blist) { // 배열에 집어넣은 게시판 정보를 반복문으로 하나씩 꺼내서 html태그에 집어넣기
      %>
      <tr>
        <td><%=temp.getBidx()%></td>
        <td>
          <a href="view.jsp?bidx=<%=temp.getBidx()%>"><%=temp.getTitle()%></a>
        </td>
        <td><%=temp.getName()%></td>
        <td><%=temp.getWdate()%></td>
        <td><%=temp.getHit()%>
        </td>
      </tr>
      <%
      }

      if (rs == null) {
      %>
      <!--       db에서 받아온 정보가 없을 시에는 아래 출력 -->
      <tr>
        <td colspan="5">등록된 게시글이 없습니다</td>
      </tr>
      <%
      }
      %>
      <tr>
        <td colspan="5">
          <%
          if (loginUser != null) {
          %>
          <button onclick="location.href='insert.jsp'">등록</button>
          <%
          }
          %>
        </td>
      </tr>
    </table>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>