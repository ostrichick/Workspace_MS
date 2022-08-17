<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
<title>데이터베이스 입력 테스트</title>
</head>
<body>

<c:choose>
	<c:when test="${empty result}">
		<h3>MySQL에 데이터 입력하기</h3>
		<hr>
		<form action="${pageContext.request.contextPath}/home/db_test2.do" method="post">
			아이디:<input type="text" name="member_id"/><p>
			비밀번호:<input type="password" name="member_pw"/><p>
			이름:<input type="text" name="member_name"/><p>
			<input type="submit" value="데이터전송" />
		</form>
	</c:when>
	<c:otherwise>
		<h3>MySQL에 데이터 입력테스트 결과</h3>
		<hr>
		<h3>${result}</h3>
	</c:otherwise>
</c:choose>



</body>
</html>