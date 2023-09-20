<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<form action="member_joinProcess.do" method="post">
			<fieldset>
				<legend>회원가입</legend>
				<p>
					<label>아이디 <br /> <input type="text" name="member_id"
						required /></label>
				</p>
				<p>
					<label>비밀번호 <br /> <input type="password" name="member_pw"
						required /></label>
				</p>
				<p>
					<label>이름 <br /> <input type="text" name="member_name"
						required /></label>
				</p>
				<p>
					<label>전화번호 <br /> <input type="number"
						name="member_handphone" /></label>
				</p>
				<p>
					<label>성별 <br /> <input type="radio" name="member_gender"
						value="남" required />남자 <br> <input type="radio"
						name="member_gender" value="여" required />여자 <br></label>
				</p>
				<p>
					<input type="submit" value="회원가입" />
				</p>
			</fieldset>
		</form>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>