<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>ajax 데이터 전송</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		$("#member_name").focusout(function(){
			
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $(this).val();

			
			$.ajax({
				type:"post",//서버로 서비스요청 방법
				url: "${pageContext.request.contextPath}/ajax_ex04.do",
				data: JSON.stringify({"member_id":member_id,
					   "member_pw":member_pw,
					   "member_name":member_name
				}),//JSON.stringify(JSON타입 객체): JSON타입 객체를 String객체로 변환시킴
				contentType: "application/json;charset=utf-8;",
				//contentType: 사용자가 서버로 보내는 내용의 MIME타입
				dataType: "json",
				success: function(data){//정상적으로 결과값을 받았을 때 실행, data:서버로부터 받은
					//결과값을 저장
					$("#result").text(data.result);
				},
				error: function(error){//통신 중 에러가 발생했을 때 실행
					alert("ajax 에러 발생");
				}
			});//end of ajax
			
		});//end of event
		
	});


</script>
</head><body>
<h3>ajax를 이용해서 서버와 통신</h3>
<hr>
요청처리 메소드의 Map형 매개변수에 데이터 매핑하기<p>

아이디:<input type="text" name="member_id" id="member_id"/><p>
비밀번호:<input type="password" name="member_pw" id="member_pw"/><p>
이름:<input type="text" name="member_name" id="member_name"/><p>
서버로부터 받은 결과값:
<div id="result"></div>


</body>
</html>