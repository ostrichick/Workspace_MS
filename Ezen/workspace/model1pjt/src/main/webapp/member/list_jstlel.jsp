<%@ page import="model1pjt.dao.UserDAO"%>
<%@ page import="model1pjt.dto.User"%>
<%@ page import="model1pjt.util.PagingUtil"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
request.setAttribute("pagingBean", pagingUtil);

ArrayList<User> ulist = userDAO.userList(pagingUtil);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 _ el</title>
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
    <table border="2" style="border-collapse: collapse;">
      <tr>
        <th></th>
        <th>스크립틀릿</th>
        <th>자바빈</th>
      </tr>
      <tr>
        <td>nowpage</td>
        <td><%=pagingUtil.getNowPage()%></td>
        <td>${pagingBean.nowPage }</td>
      </tr>
      <tr>
        <td>startpage</td>
        <td><%=pagingUtil.getStartPage()%></td>
        <td>${pagingBean.startPage }</td>
      </tr>
      <tr>
        <td>endpage</td>
        <td><%=pagingUtil.getEndPage()%></td>
        <td>${pagingBean.endPage }</td>
      </tr>
      <tr>
        <td>total</td>
        <td><%=pagingUtil.getTotal()%></td>
        <td>${pagingBean.total }</td>
      </tr>
      <tr>
        <td>perpage</td>
        <td><%=pagingUtil.getPerPage()%></td>
        <td>${pagingBean.perPage }</td>
      </tr>
      <tr>
        <td>lastpage</td>
        <td><%=pagingUtil.getLastPage()%></td>
        <td>${pagingBean.lastPage }</td>
      </tr>
      <tr>
        <td>start</td>
        <td><%=pagingUtil.getStart()%></td>
        <td>${pagingBean.start }</td>
      </tr>
      <tr>
        <td>end</td>
        <td><%=pagingUtil.getEnd()%></td>
        <td>${pagingBean.end }</td>
      </tr>
      <tr>
        <td>cntpage</td>
        <td><%=pagingUtil.getCntPage()%></td>
        <td>${pagingBean.cntPage }</td>
      </tr>
    </table>

    <hr />
    <h4>jstl 페이징</h4>
    <c:if test="${pagingBean.startPage > 1 }">
      <a href="list_jstlel.jsp?nowPage=${pagingBean.startPage - 1 }">&lt;</a>
    </c:if>
    <c:forEach var="page" begin="${pagingBean.startPage }" end="${pagingBean.endPage }">
      <c:choose>
        <c:when test="${page ne pagingBean.nowPage }">
          <a href="list_jstlel.jsp?nowPage=${page }">${page }</a>
        </c:when>
        <c:otherwise><b>${page }</b></c:otherwise>
      </c:choose>
    </c:forEach>
    <c:if test="${pagingBean.endPage ne pagingBean.lastPage }">
      <a href="list_jstlel.jsp?nowPage=${pagingBean.endPage + 1 }">&gt;</a>
    </c:if>

    <hr />

    <h4>스크립틀릿 페이지(비교용)</h4>
    <%
    // < 11 12 13 ... 20 >
    if (pagingUtil.getStartPage() > 1) {
    	// 스타트페이지가 1보다 클 경우 이전페이지 버튼 노출
    %>
    <a href="list_jstlel.jsp?nowPage=<%=pagingUtil.getStartPage() - 1%>">&lt;</a>
    <%
    }
    %>

    <%
    //페이지 목록 출력
    for (int i = pagingUtil.getStartPage(); i <= pagingUtil.getEndPage(); i++) {
    	if (i != nowPage) {
    %>
    <a href="list_jstlel.jsp?nowPage=<%=i%>"><%=i%></a>
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
    <a href="list_jstlel.jsp?nowPage=<%=pagingUtil.getEndPage() + 1%>">&gt;</a>
    <%
    }
    %>
  </div>





</body>
</html>