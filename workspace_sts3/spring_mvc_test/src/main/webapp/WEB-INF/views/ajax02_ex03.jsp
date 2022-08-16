<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 02 _ 03</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#member_idx")
				.focusout(
						function() {
							let member_idx = $("#member_idx").val();

							$
									.ajax({
										type : "post",
										url : "${pageContext.request.contextPath}/ajax02_ex03.do",
										data : {
											"member_idx" : member_idx
										},
										success : handleResult,
										error : function(error) {
											alert("에러");
										}
									});

							function handleResult(data) {
								let result = "<table border='1'><tr><th>아이디</th>"
										+ "<th>비밀번호</th><th>이름</th>"
								result += "<tr><td>" + data.member_id
										+ "</td><td>" + data.member_pw
										+ "</td><td>" + data.member_name
										+ "</td></tr>"
								result += "</table>";
								$("#result").html(result);
								console.log(data);
							}
						});
	});
</script>

</head>
<body>
	<h3>AJAX이용 서버와 통신</h3>
	<hr />
	<p>회원번호에 대한 회원정보 Map으로 받기</p>
	<p>
		회원번호 : <input type="text" name="member_idx" id="member_idx" />
	</p>
	<hr />
	서버로부터 받은 결과
	<br />
	<div id="result"></div>
</body>
</html>