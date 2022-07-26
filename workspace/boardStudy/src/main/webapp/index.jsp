<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="boardStudy.User"%>
<%
//로그인 객체 꺼내오기
User login = (User) session.getAttribute("login");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
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
    <%
    if (loginUser != null) {
    %>
    <!--   로그인 후 로그인한 회원의 이름name -->
    <h2><%=loginUser.getName()%>님 환영합니다
    </h2>
    <%
    } else {
    %>
    <!--    로그인 되어있지 않은 경우 -->
    <h2>첫 방문을 환영합니다</h2>
    <%
    }
    %>
    <h3>메인화면입니다</h3>
  </section>
  <%@include file="/include/footer.jsp"%>
  <!-- 메인페이지 게시판1 클릭시 sampletb의 입력값을 받는 화면 출력(글쓰기?)
사용자가 입력한 후 저장버튼을 누르면 sampletb 테이블에 insert한뒤 index.jsp로 이동.
insert 실패시 다시 등록페이지로 이동 -->
</body>
</html>