<%@ page import="model1pjt.dao.BoardDAO"%>
<%@ page import="model1pjt.dto.Board"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="boardModify" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="boardModify" property="*" />
<%
String bidxstr = request.getParameter("bidx");
int bidx = 0;
if (bidxstr != null && !bidxstr.equals("")) {
	bidx = Integer.parseInt(bidxstr);
}
BoardDAO boardDAO = new BoardDAO();
Board boardModify_ = boardDAO.boardModify(boardModify);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <form action="modify_action.jsp" method="post">
    <table border="2" style="border-collapse: collapse; margin: auto;">
      <tr>
        <th>글번호</th>
        <td><%=boardModify_.getBidx()%></td>
      </tr>
      <tr>
        <th>작성일</th>
        <td><%=boardModify_.getWdate()%></td>
      </tr>
      <tr>
        <th>조회수</th>
        <td><%=boardModify_.getHit()%></td>
      </tr>
      <tr>
        <th>작성자</th>
        <td><%=boardModify_.getName()%></td>
      </tr>
      <tr>
        <th>제목</th>
        <td>
          <input type="text" name="title" value="<%=boardModify_.getTitle()%>" />
        </td>
      </tr>
      <tr>
        <th>내용</th>
        <td>
          <textarea name="content" id="" cols="30" rows="10"><%=boardModify_.getContent()%></textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <input type="hidden" name="bidx" value="<%=boardModify_.getBidx()%>" />
          <button>저장</button>
        </td>
      </tr>
    </table>
  </form>
</body>
</html>