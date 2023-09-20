<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() { //$(document).ready(); 와 동일
		//비밀번호 입력란에서 커서가 이동하면 발생하는 focusout 이벤트에 대해서
		//이벤트 처리하는 구문에서 ajax통신을 통해 서버로 아이디와 비밀번호를 전송
		//서버로부터 결과값을 result div태그에 출력
		$("#member_pw").focusout(function() { //비밀번호 focus out
			let member_id = $("#member_id").val();
			let member_pw = $(this).val(); // 각각 input에서 값 가져오기

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/ajax_ex01.do",
				data : {
					"member_id" : member_id,
					"member_pw" : member_pw
				}, // 서버로 보내는 데이터
				dataType : "text", // 서버로 부터 받는 결과값의 데이터 타입
				success : function(data) { // 정상적으로 결과를 받았다면 실행, 
					$("#result").text(data); //data = 서버로부터 받는 응답결과					 
				},
				error : function(error) { //통신 중 에러 발생
					alert("에러");
				}
			});
		});
	});
</script>

</head>
<body>
	<h3>AJAX이용 서버와 통신</h3>
	<hr />
	<p>아이디와 비밀번호 서버로 전달, 결과값 받기</p>
	<p>
		아이디 : <input type="text" name="member_id" id="member_id" />
	</p>
	<p>
		비밀번호 : <input type="password" name="member_pw" id="member_pw" />
	</p>
	<hr />
	서버로부터 받은 결과
	<br />
	<div id="result"></div>
</body>
</html>