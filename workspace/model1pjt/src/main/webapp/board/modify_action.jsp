<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model1pjt.dao.BoardDAO"%>
<%@ page import="model1pjt.dto.Board"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8"); 
%>
<jsp:useBean id="boardModifyAction" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="boardModifyAction" property="*" />
<%
request.setCharacterEncoding("UTF-8");
BoardDAO boardDAO = new BoardDAO();
int result = boardDAO.boardModifyAction(boardModifyAction);

if (result != 0) {
	response.sendRedirect(request.getContextPath() + "/board/view.jsp?bidx=" + boardModifyAction.getBidx());
} else {
	response.sendRedirect(request.getContextPath() + "/board/modify.jsp?bidx=" + boardModifyAction.getBidx());
}
%>
