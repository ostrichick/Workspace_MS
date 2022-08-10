<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model1pjt.dao.BoardDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="board" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="board" property="*" />
<%
BoardDAO boardDAO = new BoardDAO();
int result = boardDAO.deleteAction(board.getBidx());

if (result != 0) {
  //  response.sendRedirect(request.getContextPath() + "/board/view.jsp?bidx=" + boardModifyAction.getBidx());
%>
<script>
alert("삭제 완료");
location.href="view.jsp?bidx=<%=board.getBidx()%>";
</script>
<%
} else {
//  response.sendRedirect(request.getContextPath() + "/board/modify.jsp?bidx=" + boardModifyAction.getBidx());
%>
<script>
  alert("삭제 실패");
  location.href="view.jsp?bidx=<%=board.getBidx()%>";
</script>
<%
}
%>
