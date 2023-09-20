<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("num1", 10);
pageContext.setAttribute("num2", 20);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <br />${num1+num2}
  <br />${num1*num2}
  <br />${num1-num2}
  <br />${num1/num2}
  <br />${num1%num2}
  <hr>
  <br />${num1>=num2}
  <br />${(num1 lt num2) or (num1+10 <= num2)}
  <br />${null eq num1}<!-- equal -->
  <br />${null ne num2}<!-- not equal -->
  <br />${empty num1}
  <br />${not empty test}<!-- null이 아니면 true 반환 -->
  <br />${num2 ge num1}<!--  greater or equal -->

</body>
</html>
