<%@page import="java.security.spec.RSAKeyGenParameterSpec"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
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
		<p>
			<span>${editResult }</span>
		</p>
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
				<th align="right">이름</th>
				<td>${member_name}</td>
			</tr>
			<tr>
				<th align="right">전화번호</th>
				<td>${member_handphone}</td>
			</tr>
			<tr>
				<th align="right">성별</th>
				<td>${member_gender}</td>
			</tr>
			<tr>
				<th align="right">회원등급</th>
				<td>${member_grade}</td>
			</tr>

		</table>
		<form action="member_edit.do" method="post" name="edit">
			<input type="button" onclick="modifyCall()" value="회원정보 수정">
		</form>
	</section>
	<%@include file="footer.jsp"%>
	<script>
		function modifyCall() {
			let edit = document.edit;
			if (edit.childElementCount < 2) {
				let checkTxt = document.createElement('p');
				let checkPw = document.createElement('input');
				let checkSubmit = document.createElement('input');
				checkTxt.innerText = "정보를 수정하려면 비밀번호를 다시 입력해주세요"
				checkPw.setAttribute('type', 'password')
				checkPw.setAttribute('name', 'member_pw')
				checkSubmit.setAttribute('type', 'submit')
				checkSubmit.setAttribute('value', '확인')
				edit.appendChild(checkTxt);
				edit.appendChild(checkPw);
				edit.appendChild(checkSubmit);
			}
		}
	</script>

</body>
</html>