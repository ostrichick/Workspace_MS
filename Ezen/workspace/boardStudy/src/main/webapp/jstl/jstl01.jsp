<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="boardStudy.*"%>
<%@ page import="java.util.*"%>
<%
pageContext.setAttribute("num1", 20);
String[] strs = { "가", "나", "다", "라" };
pageContext.setAttribute("strs", strs);

Board b1 = new Board();
b1.setTitle("1번재 게시글");
Board b2 = new Board();
b2.setTitle("2번재 게시글");
Board b3 = new Board();
b3.setTitle("3번재 게시글");
Board b4 = new Board();
b4.setTitle("4번재 게시글");

ArrayList<Board> blist = new ArrayList<>();
blist.add(b1);
blist.add(b2);
blist.add(b3);
blist.add(b4);

pageContext.setAttribute("blist", blist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 태그</title>
</head>
<body>
  <c:set var="sample" value="${num1 }" />
  ${sample+10 } ${num1+sample }
  <c:remove var="sample" />
  ${sample+10 } ${empty sample}
  <hr />
  <c:if test="${num1<10}">true이면 출력</c:if>
  <c:if test="${num1>10}">false는 출력 안함</c:if>
  <hr />
  <!--
JSTL choose 태그는 switch case문과 비슷하지만 break 없이 첫번째로 만족하는 when조건만 실행하고 바로 종료 
 -->
  <c:choose>
    <c:when test="${num1>10}">num1>10</c:when>
    <c:when test="${num1>5}">num1>5</c:when>
    <c:otherwise>위의 조건 모두 충족 안함. 기본값</c:otherwise>
  </c:choose>
  <hr />
  <c:forEach begin="1" end="10" step="2" varStatus="state">
   ㅅ${state.count } 
  </c:forEach>
  <!--for(String str:strs) -->
  <c:forEach items="${strs}" var="str">
    <br>+${str}
  </c:forEach>
  <hr />
  <table border="1" style="border-collapse: collapse;">
    <tr>
      <th>제목</th>
    </tr>
    <c:forEach items="${blist}" var="b">
      <tr>
        <th>${b.title}</th>
      </tr>
    </c:forEach>
  </table>
</body>
</html>