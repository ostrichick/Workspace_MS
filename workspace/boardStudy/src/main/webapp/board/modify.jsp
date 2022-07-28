<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.Board"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
pageContext.setAttribute("LF", "\n");
%>
<%
//db와 통신에 사용하는 sql.*과, DB연결에 사용하는 절차를 담아놓은 DBconnector 클래스, 세션에 사용할 User 클래스 임포트 

String bidxStr = request.getParameter("bidx"); // view페이지 파라미터로부터 bidx 가져옴
int bidx = 0;
if (bidxStr != null) { // bidx가 null이 아닐경우 스트링에서 인트로 변환
	bidx = Integer.parseInt(bidxStr);
}

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null; // db에서 값을 받아와서 저장하는 객체 
DBConnector dbConnector = new DBConnector(); // dbconnector 껍데기객체 생성
Board board = new Board(); // board 껍데기객체 생성

try {
	conn = dbConnector.getConnection(); // 디비 연결
	String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx=?"; // 디비에서 정보를 받아올 조인 쿼리
	psmt = conn.prepareStatement(sql); // 쿼리문 보낼준비
	psmt.setInt(1, bidx); // 물음표 채우기
	rs = psmt.executeQuery(); // 쿼리문 실행하고, 받아온 결과를 rs 객체에 집어넣음 

	if (rs.next()) { // rs 객체 안에 다음 원소가 있는한 계속 반복
		board.setBidx(rs.getInt("bidx")); // board 객체에 db에서 rs로 받아온 결과 하나씩 집어넣기
		board.setTitle(rs.getString("title"));
		board.setName(rs.getString("name"));
		board.setWdate(rs.getString("wdate"));
		board.setContent(rs.getString("content"));
		board.setHit(rs.getInt("hit"));
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
h4 {
  text-align: center
}

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
    <form action="edit_action.jsp" method="post">
      <h4>게시글 수정 페이지입니다</h4>
      <table>
        <tr>
          <th>제목</th>
          <td>
            <input type="text" value="<%=board.getTitle()%>" name="title" />
          </td>
        </tr>
        <tr>
          <th>작성자</th>
          <td>
            <%=board.getName()%>
          </td>
        </tr>
        <tr>
          <th>작성일</th>
          <td><%=board.getWdate().substring(0, 16)%></td>
          <!-- 초 미만 자르기 -->
        <tr>
          <th>조회수</th>
          <td><%=board.getHit()%></td>
        </tr>
        <tr>
          <th>내용</th>
          <td>
            <div>
              <textarea cols="30" rows="10" name="content"><%=board.getContent()%></textarea>
              <!-- textarea태그는 value가 없고 대신 그냥 기본값을 태그안에 집어넣음 -->
            </div>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="hidden" name="bidx" value="<%=board.getBidx()%>" />
            <button>수정완료</button>
          </td>
        </tr>
      </table>
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>