<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 6</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#send_btn").click(function() {
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $("#member_name").val();

			let memberVo = {
				"member_id" : member_id,
				"member_pw" : member_pw,
				"member_name" : member_name
			}

			let field_interests = [];
			$("input:checked").each(function(index, item) {
				// 체크된 input을 하나씩 조회하며 값을 배열에 추가
				field_interests[index] = $(item).val();
			});

			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/ajax_ex06.do",
				data : JSON.stringify(memberVo), // JSON객체를 string으로 변환
				contentType : "application/json;charset=utf-8",
				dataType : "json",
				success : function(data) {
					$("#result").text(data.name);
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
	<h3>AJAX이용 문자열 데이터 전송</h3>
	<hr />
	<p>데이터를 서버로 전달하고 결과값 받기</p>
	<p>
		아이디 : <input type="text" name="member_id" id="member_id" />
	</p>
	<p>
		비밀번호 : <input type="password" name="member_pw" id="member_pw" />
	</p>
	<p>
		이름 : <input type="text" name="member_name" id="member_name" />
	</p>
	<!-- 	관심분야 : -->
	<!-- 	<input type="checkbox" name="field_interests" value="Java" /> Java -->
	<!-- 	<input type="checkbox" name="field_interests" value="DB" /> DB -->
	<!-- 	<input type="checkbox" name="field_interests" value="jQuery" /> jQuery -->
	<!-- 	<input type="checkbox" name="field_interests" value="Spring" /> Spring -->
	<input type="submit" value="전송" id="send_btn" />
	<hr />
	서버로부터 받은 결과
	<br />
	<div id="result"></div>
</body>
</html>