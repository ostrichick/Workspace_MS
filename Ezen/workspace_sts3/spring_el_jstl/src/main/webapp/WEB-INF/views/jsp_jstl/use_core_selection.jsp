<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문</title>
</head>
<body>
	<h3>JSTL 코어 라이브러리 조건문</h3>
	num1 : ${num1 }
	<br> num2 : ${num2 }
	<br>
	<h4>num1과 num2 값 비교</h4>
	<c:if test="${num1 gt num2 }"> ${num1 }이 ${num2 }보다 큼	</c:if>
	<c:if test="${num1 lt num2 }"> ${num1 }이 ${num2 }보다 작음	</c:if>

	<h4>num1과 num2 값 비교2</h4>
	<c:choose>
		<c:when test="${num1 gt num2 }"> ${num1 }이 ${num2 }보다 큼	</c:when>
		<c:otherwise> ${num1 }이 ${num2 }보다 작음</c:otherwise>
	</c:choose>

</body>
</html>