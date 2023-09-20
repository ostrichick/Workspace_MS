<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AJAX 02 _ 02</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$("#interests")
				.change(
						function() {
							let interests = $("#interests:selected").val();

							$
									.ajax({
										type : "post",
										url : "${pageContext.request.contextPath}/ajax02_ex02.do",
										data : {
											"interests" : interests
										},
										success : handleResult,
										error : function(error) {
											alert("에러");
										}
									});

							function handleResult(data) {
								let result = "<table border='1'><tr><th>아이디</th>"
										+ "<th>비밀번호</th><th>이름</th>"

								for (i = 0; i < data.length; i++) {
									result += "<tr><td>" + data[i].member_id
											+ "</td><td>" + data[i].member_pw
											+ "</td><td>" + data[i].member_name
											+ "</td></tr>"
								}
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
	<p>관심분야가 같은 회원리스트 받기</p>
	<p>
		아이디 : <input type="text" name="member_id" id="member_id" />
	</p>
	<p>
		비밀번호 : <input type="password" name="member_pw" id="member_pw" />
	</p>
	<p>
		이름 : <input type="text" name="member_name" id="member_name" />
	</p>
	관심분야 :
	<select id="interests">
		<option value="Java">Java</option>
		<option value="DB">DB</option>
		<option value="jQuery">jQuery</option>
		<option value="Spring">Spring</option>
	</select>
	<input type="submit" value="전송" id="send_btn" />
	<hr />
	서버로부터 받은 결과
	<br />
	<div id="result"></div>
</body>
</html>