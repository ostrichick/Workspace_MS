<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		out.print("<h2>out 내장 객체 사용하기</h2>");
		out.print("안녕하세요");
		out.print("out 내장 객체 예제입니다.");
		out.println("<br>println 은 줄바꿈이 들어갑니다.");
	
	%>
	
	response - 응답에 대한 정보를 담고 있는 내장 객체
	
	<%
		System.out.println("리다이렉트 전");
		//request.getContextPath() - 현재 실행중인 프로젝트의 프로젝트 path 정보 반환
		response.sendRedirect(request.getContextPath()+"/0721/ex04.jsp");
	
		//forward : 요청받은 request, 응답객체 response를 새로 생성하지 않고 
		//          다른 화면으로 전달한다.
		//redirect : request와 response를 새로 만들어 화면을 이동한다.
	%>
</body>
</html>












