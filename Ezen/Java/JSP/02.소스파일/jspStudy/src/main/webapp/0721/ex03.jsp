<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>jsp 내장객체</h2>
	<h3>request : 클라이언트의 요청 정보 저장</h3>
	<ul>
		<li>
			request.getMethod() - get/post 에 대한 현재 요청 방식
			<%= request.getMethod() %>
		</li>
		<li>
			request.getRequestURL() - 호스트를 포함한 전체 요청 경로
			<%= request.getRequestURL() %>
		</li>
		<li>
			request.getRequestURI() - 호스트를 제외한 요청 경로 반환
			<%= request.getRequestURI() %>
		</li>
		<li>
			request.getServerName() - 현재 시스템의 서버 이름
			<%= request.getServerName() %>
		</li>
		<li>
			request.getServerPort() - 현재 통신 포트 번호
			<%= request.getServerPort() %>
		</li>
		<li>
			request.getRemoteAddr() - 클라이언트의 ip주소
			<%= request.getRemoteAddr() %>
		</li>
		<li>
			request.getQueryString() - 요청페이지의 파라미터 문자열 반환
			<%= request.getQueryString() %>
		</li>
		<li>
			request.getParameter("key") - 요청페이지로 넘어온 파라미터 값 반환
			<%= request.getParameter("test") %>
		</li>
	</ul>
</body>
</html>





