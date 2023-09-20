<%@page import="servletProject.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Board board = (Board) request.getAttribute("board");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
</head>
<body>
  <h4>글 내용</h4>
  <table>
    <!--     <tr> -->
    <!--       <th>글번호</th> -->
    <%--       <td><%=board.getBidx()%></td> --%>
    <!--     </tr> -->
    <!--     <tr> -->
    <!--       <th>작성일</th> -->
    <%--       <td><%=board.getWdate() %></td> --%>
    <!--     </tr> -->
    <!--     <tr> -->
    <!--       <th>조회수</th> -->
    <%--       <td><%=board.getHit()%></td> --%>
    <!--     </tr> -->
    <!--     <tr> -->
    <!--       <th>글제목</th> -->
    <%--       <td><%=board.getTitle()%></td> --%>
    <!--     </tr> -->
    <!--     <tr> -->
    <!--       <th>글내용</th> -->
    <%--       <td><%=board.getContent()%></td> --%>
    <!--     </tr> -->
  </table>
</body>
</html>