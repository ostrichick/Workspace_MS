<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
section {
	height: 500px;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<p>마이페이지</p>
		<form action="member_editProcess.do" method="post">
			<table>
				<tr>
					<th align="right">회원번호</th>
					<td>${member_idx}</td>
				</tr>
				<tr>
					<th align="right">아이디</th>
					<td>${member_id}</td>
				</tr>
				<tr>
					<th align="right">비밀번호</th>
					<td><input type="password" name="member_pw" /></td>
				</tr>
				<tr>
					<th align="right">이름</th>
					<td><input type="text" value="${member_name}"
						name="member_name" /></td>
				</tr>
				<tr>
					<th align="right">전화번호</th>
					<td><input type="text" value="${member_handphone}"
						name="member_handphone" /></td>
				</tr>
				<tr>
					<th align="right">성별</th>
					<td>${member_gender}</td>
					<!-- 					<th align="right">성별</th> -->
					<!-- 					<td><label><input type="radio" name="member_gender" value="남" required />남자 <br> <input type="radio" 	name="member_gender" value="여" required />여자 <br></label></td> -->
				</tr>
				<tr>
					<th align="right">회원등급</th>
					<td>${member_grade}</td>
				</tr>

			</table>
			<button>전송</button>
		</form>
		<p>
			<a class="deact" href="https://naver.com">회원탈퇴</a>
		</p>
		<script>
			document.querySelector(".deact").addEventListener("click",	function(e) {
			e.preventDefault();
			let confBoolean = confirm("정말 탈퇴하시겠습니까?");
				if (confBoolean == true) {
				    location.href = "<%=request.getContextPath()%>/member_deactivate.do";
				} else {
					alert('탈퇴가 취소되었습니다.');
				}
				});
		</script>
	</section>
	<%@include file="footer.jsp"%>
</body>
</html>