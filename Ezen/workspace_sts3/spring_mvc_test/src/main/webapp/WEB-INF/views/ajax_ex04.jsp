<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 4 JSON</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#member_name").focusout(function() {
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $(this).val();

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/ajax_ex04.do",
				data : JSON.stringify({
					"member_id" : member_id,
					"member_pw" : member_pw,
					"member_name" : member_name,
				}), //JSON.stringify() 이용해서 JSON객체로 변환
				dataType : "JSON",
				contentType : "application/json;charset=utf-8", // 서버로보내는 내용의 MIME타입
				success : function(data) {
					$("#result").text(data.result);
					console.log(data);
				},
				error : function(error) {
					alert("에러");
				}
			});
		});
	});
</script>

</head>
<body>
	<h3>AJAX이용 Map 전송 JSON</h3>
	<hr />
	<p>요청처리 메소드의 Map형 매개변수에 데이터 매핑</p>
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