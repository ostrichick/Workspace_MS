<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home5</title>
</head>
<body>
	<br /> ${memberVo.member_id }
	<br /> ${member_pw}
	<br /> ${member_name}
	<br /> ${field_interests }

	<c:forEach var="field" items="${memberVo.field_interests}">
		<br />${field }
	</c:forEach>
</body>
</html>