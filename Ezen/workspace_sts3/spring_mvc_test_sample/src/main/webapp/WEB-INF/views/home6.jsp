<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home6</title>
</head>
<body>

<h3>폼을 이용해서 서버로 데이터 전송</h3>
<form action="${pageContext.request.contextPath}/home/test7.do" method="post">
	아이디:<input type="text" name="member_id" /><p>
	비밀번호:<input type="password" name="member_pw" /><p>
	이름:<input type="text" name="member_name" /><p>
	관심분야:<input type="checkbox" name="field_interests" value="Java" />자바&nbsp;&nbsp;
		<input type="checkbox" name="field_interests" value="DB" />데이터베이스&nbsp;&nbsp;
		<input type="checkbox" name="field_interests" value="Spring" />스프링&nbsp;&nbsp;
		<input type="checkbox" name="field_interests" value="jQuery" />제이쿼리<p>
	<input type="submit" value="전송하기" />
</form>

<!-- web.xml에 한글처리 필터를 추가해 주어야 한글이 깨지지 않음 -->



</body>
</html>
