<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
int cnt = 10;
request.setAttribute("cnt", 20);
pageContext.setAttribute("cnt", 30); //해당JSP파일에서만 사용가능한 변수
session.setAttribute("sample", "sessionScope");
request.setAttribute("sample", "requestScope");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <%=cnt%>
  <br>
  <%=(Integer) request.getAttribute("cnt")%>
  <br> ${cnt}
  <br>${sample }
  <!-- 특정 범위를 찾고싶으면 앞에 session. request. page. 처럼 붙임 -->

  <form action="param.jsp">

    <input type="text" name="test1" />
    <br />
    <input type="text" name="test2" />
    <br />
    <input type="checkbox" name="c1" value="1" />
    일<br />
    <input type="checkbox" name="c1" value="2" />
    이<br />
    <input type="checkbox" name="c1" value="3" />
    삼<br />
    <input type="checkbox" name="c1" value="4" />
    사<br /> <br />
    <input type="submit" value="전송" />
  </form>
</body>
</html>