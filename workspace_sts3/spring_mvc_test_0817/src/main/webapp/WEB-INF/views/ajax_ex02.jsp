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
			
			//배열 생성
			let member_arr = [];//[]:new Array()와 동일
			$("input").each(function(index, item){//each():반복문
				member_arr[index] = $(item).val();
			})
			
			$.ajax({
				type:"post",//서버로 서비스요청 방법
				url: "${pageContext.request.contextPath}/ajax_ex02.do",
				data: {"member_arr":member_arr},//서버로 보내는 데이터
				dataType: "text",//서버로부터 받는 결과값에 대한 데이터타입
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
배열을 서버로 전달하고 결과값 받기<p>

아이디:<input type="text" name="member_id" id="member_id"/><p>
비밀번호:<input type="password" name="member_pw" id="member_pw"/><p>
이름:<input type="text" name="member_name" id="member_name"/><p>
서버로부터 받은 결과값:
<div id="result"></div>


</body>
</html>