<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix= "c" uri= "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix= "fn" uri= "http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<HTML>
<HEAD>
<TITLE>JSTL function 라이브러리</TITLE>
</HEAD>

<BODY style="font-size:20px;">

<h2>JSTL function 라이브러리</h2>

<c:set var= "greeting" value= "How are you?" /> 
본래의 문자열: ${greeting} <br>
모두 대문자로: ${fn:toUpperCase(greeting)} <br>
모두 소문자로: ${fn:toLowerCase(greeting)} <br>
are의 위치는? ${fn:indexOf(greeting, "are")} <br>
are를 were로 바꾸면? ${fn:replace(greeting, "are", "were")} <br>
문자열의 길이는? ${fn:length(greeting)} <br>

<c:set var="greetings" value="${fn:split(greeting,' ')}" />
<c:forEach var="greet" items="${greetings}">
	${greet}<br>
</c:forEach>
배열의 각 항목을 콤머로 구분해서 표시: ${fn:join(greetings, ", ")}<br>

</BODY>
</HTML>