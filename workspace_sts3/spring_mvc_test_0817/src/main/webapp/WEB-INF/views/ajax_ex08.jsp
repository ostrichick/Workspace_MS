<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>ajax 데이터 전송</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		$("#send_btn").click(function(){
			
			let member_id = $("#member_id").val();
			let member_pw = $("#member_pw").val();
			let member_name = $("#member_name").val();
			
			let field_interests = [];
			$("input:checked").each(function(index, item){
				field_interests[index] = $(item).val();
			})

			let memberVo = {"member_id":member_id, "member_pw":member_pw,
				"member_name":member_name, "field_interests":field_interests};
			
			$.ajax({
				type:"post",//서버로 서비스요청 방법
				url: "${pageContext.request.contextPath}/ajax_ex08.do",
				data: JSON.stringify(memberVo),//JSON객체를 String객체로 변환시킴
				contentType: "application/json;charset=utf-8;",
				dataType: "json",
				success: function(data){//정상적으로 결과값을 받았을 때 실행, data:서버로부터 받은
					//결과값을 저장
					$("#result").text(data.name);
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
데이터를 서버로 전달하고 결과값 받기<p>

아이디:<input type="text" name="member_id" id="member_id"/><p>
비밀번호:<input type="password" name="member_pw" id="member_pw"/><p>
이름:<input type="text" name="member_name" id="member_name"/><p>
관심분야:
<input type="checkbox" name="field_interests" value="Java" />자바&nbsp;&nbsp;
<input type="checkbox" name="field_interests" value="DB" />데이터베이스&nbsp;&nbsp;
<input type="checkbox" name="field_interests" value="Spring" />스프링&nbsp;&nbsp;
<input type="checkbox" name="field_interests" value="jQuery" />제이쿼리&nbsp;&nbsp;
<p>
<button id="send_btn">보내기</button><br>
서버로부터 받은 결과값:
<div id="result"></div>


</body>
</html>