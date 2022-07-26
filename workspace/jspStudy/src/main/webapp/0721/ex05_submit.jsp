<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>폼으로 정보 넘기기 연습</title>
</head>
<body>
		<h2>data1,data2,data3의 키로 입력값 넘기기. 각각 사용자가 입력한 3개의 데이터 뒤에
				_parameter라는 텍스트 추가하여 ex05_info.jsp에 전부 출력</h2>
		<form action="ex05_info.jsp" method="post">
				<p>
						데이터1 : <input type="text" name="data1" />
				</p>
				<br />
				<p>
						데이터2 : <input type="number" name="data2" />
				</p>
				<br />
				<p>
						데이터3 :
						<textarea id="" cols="30" rows="10" name="data3"></textarea>
				</p>
				<br /> <input type="submit" value="전송" />
		</form>
</body>
</html>