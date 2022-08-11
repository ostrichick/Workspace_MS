<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home4</title>
</head>
<body>
	<h4>ㅇ</h4>
	제품번호 : ${product_id }
	<br /> 국가번호 : ${country_id }

	<h4>폼을 이용해 서버로 데이터 전송</h4>
	<form action="${pageContext.request.contextPath }/home/test5.do"
		method="post">
		<br>아이디 : <input type="text" name="member_id" /> <br>비밀번호 :
		<input type="password" name="member_pw" /> <br>이름 : <input
			type="text" name="member_name" /> <br>관심분야 : <input
			type="checkbox" name="field_interests" value="Java" /> Java <input
			type="checkbox" name="field_interests" value="DB" /> DB <input
			type="checkbox" name="field_interests" value="jQuery" /> jQuery <input
			type="checkbox" name="field_interests" value="Spring" /> Spring <input
			type="submit" value="전송" />
	</form>
</body>
</html>