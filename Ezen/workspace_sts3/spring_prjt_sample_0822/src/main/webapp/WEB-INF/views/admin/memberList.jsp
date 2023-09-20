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

<script>
	$(function(){
		
		//수정하기 버튼 클릭시 이벤트 처리
		$(".adminUpdateInfo").click(function(){
			
			let member_idx = $(this).attr("name");
			let id_input = "#member_grade"+member_idx;
			let member_grade = $(id_input).val();
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/admin/update_grade.do",
				data: {
					"member_idx": member_idx,
					"member_grade": member_grade
				},
				success: function(data){
					if(data == "N"){
						alert("회원등급 수정 실패!");
					}else{
						alert("회원등급 수정 성공!");
						$(id_input).attr("disabled", true);
					}
				},
				error: function(error){ alert("회원등급 수정 중 에러발생"); }
			});
			
		});//end of 수정하기 버튼 클릭시 이벤트 처리
		
		//삭제하기 버튼 클릭시 이벤트 처리
		$("#adminDeleteInfo").click(function(){
			
			let member_idx_arr = new Array();
			
			//삭제 체크박스를 체크한 jQuery객체들로부터 member_idx값을 배열에 저장
			$("input:checked").each(function(index, item){
				member_idx_arr[index] = $(item).val();
			});
			
			$.ajax({
				type: "post",
				url: "${pageContext.request.contextPath}/admin/delete_member.do",
				data: { "member_idx_arr": member_idx_arr },
				success: function(data){
					if(data == "N"){
						alert("회원삭제 실패!");
					}else{
						//회원목록에서 삭제 체크된 회원정보를 테이블에서 삭제하기
						$("tr:has(input:checked)").remove();
					}
				},
				error: function(error){ alert("회원삭제 중 에러발생"); }
			});
			
		});//end of 삭제하기 버튼 클릭시 이벤트 처리
		
		
	});

</script>


</head>
<body>

<div id="container" style="float:left;">

	<h3 style="text-align:center;margin-top:50px;">회 원 목 록</h3>
	
	<table border="1px">
		<tr>
			<th>회원번호</th><th>이름</th><th>아이디</th><th>비밀번호</th><th>성별</th><th>회원등급</th><th>등급수정</th>
			<th>핸드폰번호</th><th>가입일시</th><th>삭제여부</th><th>DB삭제여부</th>
		</tr>
		
		<c:forEach var="memberVo" items="${memberList}">
			<tr>
				<td>${memberVo.member_idx}</td><td>${memberVo.member_name}</td>
				<td>${memberVo.member_id}</td><td>${memberVo.member_pw}</td><td>${memberVo.member_gender}</td>
				<td><input type="text" id="member_grade${memberVo.member_idx}" value="${memberVo.member_grade}" size="5" /></td>
				<td><button class="adminUpdateInfo" name="${memberVo.member_idx}">수정하기</button></td>
				<td>${memberVo.member_handphone}</td><td>${memberVo.reg_date}</td>
				<td>${memberVo.del_yn}</td>
				<td>삭제<input type="checkbox" value="${memberVo.member_idx}" /></td>
			</tr>
		</c:forEach>
			<tr>
				<td colspan="10"></td>
				<td><button id="adminDeleteInfo">삭제하기</button></td>
			</tr>
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