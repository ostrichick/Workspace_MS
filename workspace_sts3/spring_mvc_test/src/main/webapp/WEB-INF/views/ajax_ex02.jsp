<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 2</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#member_name").focusout(function() {
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $(this).val();

			//배열 생성
			let member_arr = [];
			$("input").each(function(index, item) {
				member_arr[index] = $(item).val();
			});
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/ajax_ex02.do",
				data : {
					"member_arr" : member_arr
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
	<h3>AJAX이용 배열 전송</h3>
	<hr />
	<p>배열을 서버로 전달, 결과값 받기</p>
	<p>
		아이디 : <input type="text" name="member_id" id="member_id" />
	</p>
	<p>
		비밀번호 : <input type="password" name="member_pw" id="member_pw" />
	</p>
	<p>
		이름 : <input type="text" name="member_name" id="member_name" />
	</p>
	<hr />
	서버로부터 받은 결과
	<br />
	<div id="result"></div>
</body>
</html>