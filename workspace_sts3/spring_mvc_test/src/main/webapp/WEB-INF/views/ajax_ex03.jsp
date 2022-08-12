<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 3</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#member_name").focusout(function() {
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $(this).val();

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/ajax_ex03.do",
				data : {
					"member_id" : member_id,
					"member_pw" : member_pw,
					"member_name" : member_name,
				},
				success : function(data) {  
					$("#result").text(data);					 
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
	<h3>AJAX이용 Map 전송</h3>
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