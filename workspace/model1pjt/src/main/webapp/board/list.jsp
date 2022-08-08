<%@ page import="model1pjt.dao.BoardDAO"%>
<%@ page import="model1pjt.dto.Board"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
BoardDAO boardDAO = new BoardDAO();
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
%>
<jsp:useBean id="boardList" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="boardList" property="*" />
<%
ArrayList<Board> blist = boardDAO.boardList(boardList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h2>게시판 목록</h2>
  <div class="searchArea">
    <form action="list.jsp" method="get">
      <select name="searchType" id="">
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
  <table border="2" style="border-collapse: collapse; margin: auto;">
    <tr>
      <td>글번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>작성일</td>
      <td>조회수</td>
    </tr>
    <%
    for (Board board : blist) {
    %>
    <tr>
      <td><%=board.getBidx()%></td>
      <td>
        <a href="view.jsp?bidx=<%=board.getBidx()%>"> <%=board.getTitle()%></a>
      </td>
      <td><%=board.getName()%></td>
      <td><%=board.getWdate()%></td>
      <td><%=board.getHit()%></td>
    </tr>
    <%
    }
    %>
    <tr>
      <td colspan="5">
        <button onclick="location.href='insert.jsp'">등록</button>
      </td>
    </tr>
  </table>

</body>
</html>