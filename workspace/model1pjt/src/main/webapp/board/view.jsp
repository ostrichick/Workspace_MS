<%@ page import="model1pjt.dao.BoardDAO"%>
<%@ page import="model1pjt.dto.Board"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="boardView" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="boardView" property="*" />
<%
BoardDAO boardDAO = new BoardDAO();
Board boardView_ = boardDAO.boardView(boardView);
pageContext.setAttribute("LF", "\n");
pageContext.setAttribute("cout", boardView.getContent());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <table border="2" style="border-collapse: collapse; margin: auto;">
    <tr>
      <th>글번호</th>
      <td><%=boardView_.getBidx()%></td>
    </tr>
    <tr>
      <th>작성일</th>
      <td><%=boardView_.getWdate()%></td>
    </tr>
    <tr>
      <th>조회수</th>
      <td><%=boardView_.getHit()%></td>
    </tr>
    <tr>
      <th>작성자</th>
      <td><%=boardView_.getName()%></td>
    </tr>
    <tr>
      <th>제목</th>
      <td><%=boardView_.getTitle()%></td>
    </tr>
    <tr>
      <th>내용</th>
      <td>
        <c:out escapeXml="false" value="${fn:replace(cout, LF, '<br>')}"></c:out>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <button onclick="location.href='modify.jsp?bidx=<%=boardView.getBidx()%>'">수정하기</button>
      </td>
    </tr>
  </table>
</body>
</html>