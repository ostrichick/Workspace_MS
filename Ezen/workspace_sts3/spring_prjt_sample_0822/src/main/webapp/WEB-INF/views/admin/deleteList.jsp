<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>

<!--  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

<div id="container" style="float:left;">

	<h3 style="text-align:center;margin-top:50px;">회 원 목 록</h3>
	<hr/>
	
	<table border="1px">
		<tr>
			<th>변경번호</th><th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>성별</th><th>회원등급</th>
			<th>핸드폰번호</th><th>가입일시</th><th>탈퇴여부</th><th>변경구분</th><th>변경일자</th><th>사용자계정</th>
		</tr>
		
		<c:forEach var="memberVo" items="${deleteList}">
			<tr>
				<td>${memberVo.member_bak_idx}</td><td>${memberVo.member_idx}</td>
				<td>${memberVo.member_name}</td>
				<td>${memberVo.member_id}</td><td>${memberVo.member_pw}</td>
				<td>${memberVo.member_gender}</td><td>${memberVo.member_grade}</td>
				<td>${memberVo.member_handphone}</td><td>${memberVo.reg_date}</td>
				<td>${memberVo.del_yn}</td><td>${memberVo.modify_type}</td>
				<td>${memberVo.modify_date}</td><td>${memberVo.modify_user}</td>
			</tr>
		</c:forEach>
	</table>
	<a href="${pageContext.request.contextPath}/admin/index.do">관리자 메인페이지</a>
</div>

<script>
	$(function(){//jQuery구문
		
		let width_str = $("#container").css("width");//px을 포함한 문자열 값 
		let div_container_width = parseInt(width_str.substring(0, width_str.indexOf('p')));
		//window.innerWidth-현재 브라우저 화면의 가로 크기 반환
		let margin_left = (window.innerWidth - div_container_width)/2;
		$("#container").css("margin-left", margin_left);
		
		$(window).on('resize', function(){//브라우저 화면 사이즈 변경때마다 호출
			margin_left = (window.innerWidth - div_container_width)/2;
			$("#container").css("margin-left", margin_left);
		});
		
	});
</script>


</body>
</html>