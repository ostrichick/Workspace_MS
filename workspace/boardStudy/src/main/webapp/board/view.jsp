<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%><%@ page import="boardStudy.DBConnector"%><%@ page import="boardStudy.Board"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
pageContext.setAttribute("LF", "\n");
%>
<%
//db와 통신에 사용하는 sql.*과 통신하는 명령어를 직접담은 디비커넥터 클래스, 세션에 사용할 유저클래스, 정보를 담을 어레이리스트 임포트 

Connection conn = null;
PreparedStatement psmt = null;
ResultSet rs = null; // db에서 값을 받아와서 저장하는 객체 
DBConnector dbConnector = new DBConnector(); // dbconnector 껍데기객체 생성
Board board = new Board(); // board 껍데기객체 생성
String bidxStr = request.getParameter("bidx"); // 리스트페이지 파라미터로부터 bidx 가져옴
int bidx = 0;
if (bidxStr != null) { // 비인덱스 널이 아닐경우 스트링에서 인트로 변환
	bidx = Integer.parseInt(bidxStr);
}

try {
	conn = dbConnector.getConnection(); // 디비 연결
	String sql = "select * from boardtb b inner join usertb u on b.uidx = u.uidx where bidx=?"; // 디비에서 뷰에 담을 정보를 받아올 조인 쿼리
	psmt = conn.prepareStatement(sql);
	psmt.setInt(1, bidx); // 물음표 채우기
	rs = psmt.executeQuery(); // 쿼리로 받아온 결과를 rs에 집어넣음 

	if (rs.next()) { // rs 객체 안에 다음 원소가 있는한 계속 반복
		board.setBidx(rs.getInt("bidx")); // board 객체에 db에서 rs로 얻은 결과 하나씩 집어넣기
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
        <td><%=board.getWdate().substring(0, 16)%></td>
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
      <tr><td colspan="2"><button onclick="location.href = 'edit.jsp?bidx=<%=board.getBidx()%>';">수정</button></td></tr>        
    </table>
    
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>