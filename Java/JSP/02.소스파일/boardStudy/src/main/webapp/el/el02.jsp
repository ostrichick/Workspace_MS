<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("num1", 10);
	pageContext.setAttribute("num2", 20);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>e1의 연산자</h2>
	${num1+num2}
	${num1-num2}
	${num1*num2}
	${num1/num2}
	${num1%num2}
	
	${(num1+10)>=num2}
	${(num1>20) && (num2<20)}
	
	${test eq null} <!--  == -->
	${test ne null} <!--  != -->
	${not empty test}<!-- null 체크시 사용 null이 아니면 true 반환 -->
	${num1 le num2 } <!-- <= -->
	${num1 ge num2 } <!-- >= -->
	${num1 le 10 and num2 ge 20} <!-- num1<=10 && num2>=20 -->
	${num1 le 10 or num2 ge 20} <!-- num1<=10 || num2>=20 -->
</body>
</html>










