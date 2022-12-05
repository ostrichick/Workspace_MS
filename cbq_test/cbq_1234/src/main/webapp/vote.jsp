<%@page import="cbq_1234.DBConnector"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>
<style>
table td {
	text-align: left;
}
</style>
</head>
<body>
	<%@include file="header.jsp"%>
	<section>
		<h3>투표하기</h3>
		<form id="form_vote" action="vote_process.jsp" method="post">
			<table>
				<tr>
					<th>주민번호</th>
					<td><input type="text" id="m_jumin" name="m_jumin"> 예:
						8906153154726</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" id="m_name" name="m_name"></td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td><select name="m_no" id="m_no">
							<option value="" selected></option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
					</select></td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time" id="v_time"></td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area" id="v_area"></td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td><input type="radio" name="v_confirm" value="Y"
						id="v_confirm_y">확인<input type="radio" name="v_confirm"
						value="N" id="v_confirm_n">미확인</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="button" value="투표하기" onclick="fn_submit()"><input
						type="reset" value="다시하기"
						onclick="alert('정보를 지우고 처음부터 다시 입력합니다!');document.querySelector('#m_jumin').focus();"></td>
				</tr>
			</table>
		</form>
	</section>
	<script>
		document.querySelector("#v_confirm_y").checked = false;

		function fn_submit() {
			let m_jumin = document.querySelector("#m_jumin");
			let m_name = document.querySelector("#m_name");
			let m_no = document.querySelector("#m_no");
			let v_time = document.querySelector("#v_time");
			let v_area = document.querySelector("#v_area");
			let v_confirm_y = document.querySelector("#v_confirm_y");
			let v_confirm_n = document.querySelector("#v_confirm_n");

			if (m_jumin.value.length < 1) {
				alert('주민번호가 입력되지 않았습니다!')
				m_jumin.focus();
			} else if (m_name.value.length < 1) {
				alert('성명이 입력되지 않았습니다!')
				m_name.focus();
			} else if (m_no.value.length < 1) {
				alert('후보번호가 선택되지 않았습니다!')
				m_no.focus();
			} else if (v_time.value.length < 1) {
				alert('투표시간이 입력되지 않았습니다!')
				v_time.focus();
			} else if (v_area.value.length < 1) {
				alert('투표장소가 입력되지 않았습니다!')
				v_area.focus();
			} else if (!v_confirm_y.checked && !v_confirm_n.checked) {
				alert('유권자확인이 선택되지 않았습니다!')
				m_jumin.focus();
			} else {
				document.querySelector("#form_vote").submit();
			}
		}
	</script>
	<%@include file="footer.jsp"%>
</body>
</html>