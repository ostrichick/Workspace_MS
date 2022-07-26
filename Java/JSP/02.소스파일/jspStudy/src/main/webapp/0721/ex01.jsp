<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<%@ page import="java.util.*" %> <!-- 외부 패키지의 클래스를 포함하는 지시자 -->
<%@ page import="jspStudy.Sample" %>
<%
	List<String> sList = new ArrayList<>();
	sList.add("안녕하세요");
	
	Sample sample = new Sample();
	sample.method();
	
	int result = 10/0;

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp 지시자 문법 예제</h2>
</body>
</html>