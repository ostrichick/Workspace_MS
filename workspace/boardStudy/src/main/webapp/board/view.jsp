<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.Board"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
pageContext.setAttribute("LF", "\n");
%>
<%
//db와 통신에 사용하는 sql.*과 통신하는 명령어를 직접담은 디비커넥터 클래스, 세션에 사용할 유저클래스, 정보를 담을 어레이리스트 임포트 

// User login = (User) session.getAttribute("login"); // Object로 반환되는 세션 객체를 User로 강제형변환
// if (login == null) { // NPE를 막기위해 비로그인 사용자도 아무내용없는 껍데기 유저객체를 생성해서 DB결과와 비교하게함
// 	login = new User();
// }

Connection conn = null;
PreparedStatement psmt = null;
PreparedStatement psmtHit = null;
ResultSet rs = null; // db에서 값을 받아와서 저장하는 객체 
DBConnector dbConnector = new DBConnector(); // dbconnector 껍데기객체 생성
Board board = new Board(); // board 껍데기객체 생성, 자바빈즈 (데이터를 담는 그릇)
String bidxStr = request.getParameter("bidx"); // 리스트페이지 파라미터로부터 bidx 가져옴
int bidx = 0;
if (bidxStr != null) { // 비인덱스 널이 아닐경우 스트링에서 인트로 변환
	bidx = Integer.parseInt(bidxStr);
}

try {
	conn = dbConnector.getConnection(); // 디비 연결

	String sqlHit = "UPDATE BOARDTB SET HIT=HIT+1 WHERE BIDX=?";
	psmtHit = conn.prepareStatement(sqlHit);
	psmtHit.setInt(1, bidx);
	psmtHit.executeUpdate();

	String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx=?"; // 디비에서 뷰에 담을 정보를 받아올 조인 쿼리
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, bidx); // 물음표 채우기
	rs = psmt.executeQuery(); // 쿼리로 받아온 결과를 rs에 집어넣음
	if (rs.next()) { // rs 객체 안에 다음 원소가 있는한 계속 반복
		board.setBidx(rs.getInt("bidx")); // board 객체에 db에서 rs로 얻은 결과 하나씩 집어넣기
		board.setTitle(rs.getString("title"));
		board.setContent(rs.getString("content"));
		board.setName(rs.getString("name"));
		board.setWdate(rs.getString("wdate"));
		board.setHit(rs.getInt("hit"));
		board.setUidx(rs.getInt("uidx"));
	}
	// 	String sqlHit = "UPDATE BOARDTB SET HIT=? WHERE BIDX=?";
	// 	psmtHit = conn.prepareStatement(sqlHit);
	// 	psmtHit.setInt(1, rs.getInt("hit") + 1);
	// 	psmtHit.setInt(2, bidx);
	// 	psmtHit.executeUpdate();

} catch (Exception e) {
	e.printStackTrace(); // 예외처리
} finally {
	dbConnector.connClose(); // jdbc 연결 닫기
	if (psmt != null) {
		psmt.close();
	}
	if (psmtHit != null) {
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
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <table>
      <tr>
        <th>제목</th>
        <td><%=board.getTitle()%></td>
      </tr>
      <tr>
        <th>작성자</th>
        <td><%=board.getName()%></td>
      </tr>
      <tr>
        <th>작성일</th>
        <td><%=board.getWdate()%></td>
        <!-- 초 미만 자르기 -->
      <tr>
        <th>조회수</th>
        <td><%=board.getHit()%></td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <%
          pageContext.setAttribute("cout", board.getContent()); // 출력할 내용을 두번째 매개변수로
          %>
          <div>
            <c:out escapeXml="false" value="${fn:replace(cout, LF, '<br>')}"></c:out>
            <!-- 줄바꿈 문자 LF를 <br>태그로 변경 -->
          </div>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <%
          if ((loginUser != null) && loginUser.getUidx() == board.getUidx()) {
          %>
          <button onclick="location.href = 'modify.jsp?bidx=<%=board.getBidx()%>';">수정</button>
          <button onclick="deleteFn()">삭제</button>
          <form action="delete.jsp?bidx=<%=board.getBidx()%>" method="post" name="delFrm">
            <input type="hidden" name="bidx" value="<%=board.getBidx()%>" />
          </form>
          <script>
                      function deleteFn() {
                        document.delFrm.submit();
                      }
                    </script>
          <!-- 삭제는 아무나 주소입력해서 못하게끔 post방식으로 -->
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