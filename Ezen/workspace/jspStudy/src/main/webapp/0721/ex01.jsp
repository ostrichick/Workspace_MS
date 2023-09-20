<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8" errorPage="ex01_error.jsp" 
%><!-- 에러페이지 -->
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="jspStudy.Sample"%>
<%-- <%@ page import="java.util.*" %> 외부 패키지의 클래스를 포함하는 지시자 --%>
<%
List<String> sList = new ArrayList<>();
sList.add("ㅎㅇㅇㅇㅇ");

Sample sample = new Sample();
sample.method();

int result = 10/0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0721</title>
</head>
<body>
		<h1>jsp 지시자 문법 예제</h1>
</body>
</html>