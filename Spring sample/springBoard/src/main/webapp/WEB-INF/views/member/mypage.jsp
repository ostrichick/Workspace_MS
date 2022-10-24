<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function delFn(){
		var result = confirm("정말 탈퇴하시겠습니까?");
		if(result){
			location.href="delete.do";
		}
	}
</script>
</head>
<body>
	<h2>마이 페이지</h2>
	
	<table>
		<tr>
			<th>회원 번호</th>
			<td>${member.midx}</td>
		</tr>
		<tr>
			<th>회원 아이디</th>
			<td>${member.mid}</td>
		</tr>
		<tr>
			<th>회원 비밀번호</th>
			<td>${member.password}</td>
		</tr>
		<tr>
			<th>회원 주소</th>
			<td>${member.addr}</td>
		</tr>
		<tr>
			<th>회원 연락처</th>
			<td>${member.phone}</td>
		</tr>
	</table>
	
	<button onclick="location.href='modify.do'">회원 정보 수정</button>
	<button onclick="delFn()">회원 탈퇴</button>
</body>
</html>





