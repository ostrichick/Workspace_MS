<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h3>e1사용한 계산기</h3>
  <!--   <form action="calculator" method="get"> -->
  <form action="" method="get">
    num1:
    <input type="number" name="num1" />
    <br>num2:
    <input type="number" name="num2" />
    <br />
    <input type="radio" name="oper" value="plus" />
    +
    <input type="radio" name="oper" value="minus" />
    -
    <input type="radio" name="oper" value="multi" />
    *
    <input type="radio" name="oper" value="div" />
    /
    <input type="radio" name="oper" value="rest" />
    % <br />
    <input type="submit" value="계산" />
  </form>
  <hr />
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