<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8"><title>ajax 데이터 전송</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function(){
		
		$("#interests").change(function(){
			
			let interests = $("#interests:selected").val();
			
			$.ajax({
				type:"post",//서버로 서비스요청 방법
				url: "${pageContext.request.contextPath}/ajax2_ex1.do",
				data: {"interests":interests},
				success: function(data){
					let result = "<table border='1'><tr><th>아이디</th>"
						+ "<th>비밀번호</th><th>이름</th></tr>"
					
					for(i=0; i<data.length; i++){
						result += "<tr><td>"+data[i].member_id
								  +"</td><td>"+data[i].member_pw
								  +"</td><td>"+data[i].member_name+"</td></tr>";
					}
					result += "</table>";	
						
					$("#result").html(result);
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
관심분야가 같은 회원 리스트 받기<p>

관심분야:
<select id="interests">
	<option value="Java">자바</option>
	<option value="DB">데이터베이스</option>
	<option value="Spring">스프링</option>
	<option value="jQuery">제이쿼리</option>
</select>
<p>
<button id="send_btn">보내기</button><br>
서버로부터 받은 결과값:
<div id="result"></div>


</body>
</html>