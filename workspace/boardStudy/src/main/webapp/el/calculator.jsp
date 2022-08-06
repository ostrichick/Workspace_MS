<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <%-- ${param.num1 }  --%>
  <%-- ${param.oper eq "plus" ? "+" : ""}  --%>
  <%-- ${param.oper eq "minus" ? "-" : ""} --%>
  <%-- ${param.oper eq "multi" ? "*" : ""} --%>
  <%-- ${param.oper eq "div" ? "/" : ""} --%>
  <%-- ${param.oper eq "rest" ? "%" : ""} --%>
  <%-- ${param.num2 } :  --%>
  <%-- ${param.oper eq "plus" ? param.num1 + param.num2 : ""}  --%>
  <%-- ${param.oper eq "minus" ? param.num1 - param.num2 : ""}  --%>
  <%-- ${param.oper eq "multi" ? param.num1 * param.num2 : ""}  --%>
  <%-- ${param.oper eq "div" ? param.num1 / param.num2 : ""}  --%>
  <%-- ${param.oper eq "rest" ? param.num1 % param.num2 : ""} --%>

  <c:choose>
  <c:when test="${param.oper eq 'plus' }"> ${param.num1 } + ${param.num2 } = ${param.num1+param.num2 }</c:when>
  <c:when test="${param.oper eq 'minus' }"> ${param.num1 } - ${param.num2 } = ${param.num1-param.num2 }</c:when>
  <c:when test="${param.oper eq 'multi' }"> ${param.num1 } * ${param.num2 } = ${param.num1*param.num2 }</c:when>
  <c:when test="${param.oper eq 'div' }"> ${param.num1 } / ${param.num2 } = ${param.num1/param.num2 }</c:when>
  <c:when test="${param.oper eq 'rest' }"> ${param.num1 } % ${param.num2 } = ${param.num1%param.num2 }</c:when>
  <c:otherwise>잘못된 입력</c:otherwise>
  </c:choose>
</body>
</html>