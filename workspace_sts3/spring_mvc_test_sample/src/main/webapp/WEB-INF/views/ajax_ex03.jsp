<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>ajax 데이터 전송</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){//$(document).ready()와 동일
		//비밀번호 입력란에서 커서가 이동하면 발생하는 focusout이벤트에 대해서
		//이벤트처리하는 구문에서 ajax통신을 통해 서버로 아이디와 비밀번호를 전송하고
		//서버로부터 결과값을 result div태그에 출력함
		
		$("#member_name").focusout(function(){
			
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $(this).val();

			
			$.ajax({
				type:"post",//서버로 서비스요청 방법
				url: "${pageContext.request.contextPath}/ajax_ex03.do",
				data: {"member_id":member_id,
					   "member_pw":member_pw,
					   "member_name":member_name
				},//서버로 보내는 데이터
				success: function(data){//정상적으로 결과값을 받았을 때 실행, data:서버로부터 받은
					//결과값을 저장
					$("#result").text(data);
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