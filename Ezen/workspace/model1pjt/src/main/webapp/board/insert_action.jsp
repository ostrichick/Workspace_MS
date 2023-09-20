<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model1pjt.dao.BoardDAO"%>
<%@ page import="model1pjt.dto.Board"%>
<%@ page import="model1pjt.dto.User"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="boardParam" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="boardParam" property="*" />
<%
User loginSession = (User) session.getAttribute("loginSession");
boardParam.setUidx(loginSession.getUidx());
BoardDAO boardDAO = new BoardDAO();
int result = boardDAO.boardInsert(boardParam);

if (result != 0) {
	response.sendRedirect(request.getContextPath() + "/board/list.jsp");
} else {
	response.sendRedirect(request.getContextPath() + "/board/insert.jsp");
}
%>
