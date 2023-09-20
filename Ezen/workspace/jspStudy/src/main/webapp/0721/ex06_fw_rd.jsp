<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
out.print("<title>out 내장 객체 사용하기</title>");
%>
</head>
<body>
		<%
		out.print("<h3>out 내장 객체 사용하기</h3>");
		out.println("ㅇㅇ");
		out.println("안녕하세요");
		out.println("안녕하세요");
		out.println("안녕하세요");
		%>
		<!-- 보통 디버깅용으로 사용 -->
		response - 응답에 대한 정보를 담고있는 내장 객체
		<%
		System.out.println("리다이렉트 전");
		// response.sendRedirect("/0721/ex04.jsp"); // 도메인을 제외한 url
		// response.sendRedirect("/jspStudy/0721/ex04.jsp"); // 프로젝트 이름이 포함돼서 유지보수 힘듬
		response.sendRedirect(request.getContextPath()+"/0721/ex04.jsp"); // 유지보수 쉬움
		System.out.println("리다이렉트 후");
		
		//forward : 요청받은 request, 응답객체 response를 새로 생성하지 않고 다른 화면으로 전달
		//redirect : request와 response를 새로 만들어 화면을 이동
		%>
</body>
</html>