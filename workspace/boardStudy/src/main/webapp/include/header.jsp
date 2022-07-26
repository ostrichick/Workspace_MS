<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="boardStudy.User"%>
<%
//로그인 객체 꺼내오기
User loginUser = (User) session.getAttribute("login");
%>
<header>
  <h2>게시판 만들기 연습 페이지</h2>
  <nav>
    <div class="menuArea">
      <ul>
        <li><a href="<%=request.getContextPath()%>/write.jsp">글쓰기</a></li>
        <li>게시판2</li>
        <li>게시판3</li>
      </ul>
    </div>
    <div class="loginArea">

      <a href="<%=request.getContextPath()%>/index.jsp">메인</a> |
      <%
      if (loginUser == null) {
      %>
      <!--     로그인이 안 되어 있을 때 -->
      <a href="<%=request.getContextPath()%>/login/login.jsp">로그인</a> | <a href="<%=request.getContextPath()%>/login/join.jsp">회원가입</a> <%
 } else {
 %>
      <!--       로그인이 돼 있을 때 -->
      <a href="<%=request.getContextPath()%>/login/logout.jsp">로그아웃</a> | <a href="<%=request.getContextPath()%>/login/mypage.jsp">마이페이지</a>
      <%
      }
      %>
    </div>
  </nav>
</header>