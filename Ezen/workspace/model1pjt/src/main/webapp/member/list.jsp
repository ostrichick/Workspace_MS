<%@ page import="model1pjt.dao.UserDAO"%>
<%@ page import="model1pjt.dto.User"%>
<%@ page import="model1pjt.util.PagingUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
UserDAO userDAO = new UserDAO();

///////////////////////////페이징
String nowPageStr = request.getParameter("nowPage");
int nowPage = 1;
if (nowPageStr != null && !nowPageStr.equals("")) {
	nowPage = Integer.parseInt(nowPageStr);
}
int total = userDAO.total();
PagingUtil pagingUtil = new PagingUtil(nowPage, total, 5);
%>
<jsp:useBean id="boardList" class="model1pjt.dto.Board" scope="request" />
<jsp:setProperty name="boardList" property="*" />
<%
ArrayList<User> ulist = userDAO.userList(pagingUtil);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
  <h2>회원 목록</h2>
  <table border="2" style="border-collapse: collapse; margin: auto;">
    <tr>
      <td>회원번호</td>
      <td>이름</td>
      <td>아이디</td>
      <td>주소</td>
    </tr>
    <%
    for (User userT : ulist) {
    %>
    <tr>
      <td><%=userT.getUidx()%></td>
      <td><%=userT.getName()%></td>
      <td><%=userT.getId()%></td>
      <td><%=userT.getAddr()%></td>
    </tr>
    <%
    }
    %>

  </table>
  <div style="margin: auto; text-align: center">
    <%
    // < 11 12 13 ... 20 >

    if (pagingUtil.getStartPage() > 1) {
    	// 스타트페이지가 1보다 클 경우 이전페이지 버튼 노출
    %>
    <a href="list.jsp?nowPage=<%=pagingUtil.getStartPage() - 1%>">&lt;</a>
    <%
    }
    %>

    <%
    //페이지 목록 출력
    for (int i = pagingUtil.getStartPage(); i <= pagingUtil.getEndPage(); i++) {
    	if (i != nowPage) {
    %>
    <a href="list.jsp?nowPage=<%=i%>"><%=i%></a>
    <%
    } else {
    %><b><%=i%></b>
    <%
    }
    }
    %>
    <%
    if (pagingUtil.getEndPage() != pagingUtil.getLastPage()) {
    	// 엔드페이지가 라스트페이지에 아직 도달하지 못한경우
    %>
    <a href="list.jsp?nowPage=<%=pagingUtil.getEndPage() + 1%>">&gt;</a>
    <%
    }
    %>
  </div>





</body>
</html>