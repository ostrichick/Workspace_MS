<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>ajax 데이터 전송</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		$("#member_idx").focusout(function(){
			
			let member_idx = $("#member_idx").val();
			
			$.ajax({
				type:"post",//서버로 서비스요청 방법
				url: "${pageContext.request.contextPath}/ajax2_ex4.do",
				data: {"member_idx":member_idx},
				success: handleResult,
				error: function(error){//통신 중 에러가 발생했을 때 실행
					alert("ajax 에러 발생");
				}
			});//end of ajax
			
			function handleResult(data){
				let result = "<table border='1'><tr><th>아이디</th>"
					+ "<th>비밀번호</th><th>이름</th></tr>"
				
					result += "<tr><td>"+data.member_id
							  +"</td><td>"+data.member_pw
							  +"</td><td>"+data.member_name+"</td></tr>";
				result += "</table>";	
					
				$("#result").html(result);
			}
			
		});//end of event
		
	});


</script>
</head><body>
<h3>ajax를 이용해서 서버와 통신</h3>
<hr>
회원번호에 대한 회원정보 Map으로 받기<p>

회원번호:<input type="text" name="member_idx" id="member_idx"/>
<p>
서버로부터 받은 결과값:
<div id="result"></div>


</body>
</html>