<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>서버로 데이터 전송</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/home/sample.do">sample</a>
	<hr />
	<h3>서버로 데이터 보내기</h3>
	<ul>
		<li><a
			href="${pageContext.request.contextPath}/home/test2.do?name=홍길동&id=hong">이름과
				아이디 서버로 전송하기</a></li>

		<li><a
			href="${pageContext.request.contextPath}/home/test3.do?name=홍길동2&id=hong2">이름과
				아이디 서버로 전송하기</a></li>

		<li><a href="${pageContext.request.contextPath}/home/test4/100">요청정보를
				통해 서버에 값 전송하기</a></li>

		<li><a
			href="${pageContext.request.contextPath}/home/P0001/C001/test5.do">요청정보를
				통해 서버에 값 전송하기2</a></li>

		<li><a href="${pageContext.request.contextPath}/home/test6.do">폼을
				이용해서 서버로 데이터 전송</a></li>
	</ul>
	<p>
	<h3>[ajax통신:전송]서버로 데이터 보내기</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/home/ajax.do">
				아이디와 비밀번호 전송하기</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax2.do">
				배열 전송하기</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax3.do">
				요청처리 메소드의 Map타입 매개변수와 매핑하기</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax4.do">
				요청처리 메소드의 Map타입 매개변수와 매핑하기(JSON타입)</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax5.do">
				요청처리 메소드로 문자열과 배열을 동시에 전송하기</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax6.do">
				요청처리 메소드의 커맨드객체에 데이터 전송하기1</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax7.do">
				요청처리 메소드의 커맨드객체에 데이터 전송하기2</a></li>

		<li><a href="${pageContext.request.contextPath}/home/ajax8.do">
				요청처리 메소드의 커맨드객체에 데이터 전송하기3</a></li>
	</ul>

	<h3>[ajax통신:수신]서버에서 데이터 받기</h3>
	<ul>
		<li><a
			href="${pageContext.request.contextPath}/home/ajax02_ex01.do">
				List로 데이터 받기</a></li>

		<li><a
			href="${pageContext.request.contextPath}/home/ajax02_ex02.do">
				List로 데이터 받기(별도의 함수 정의)</a></li>

		<li><a
			href="${pageContext.request.contextPath}/home/ajax02_ex03.do">
				Map으로 데이터 받기</a></li>

		<li><a
			href="${pageContext.request.contextPath}/home/ajax02_ex04.do">
				객체로 데이터 받기</a></li>
	</ul>

	<h3>[MyBatis를 이용한 MySQL연결]DB 작업</h3>
	<ul>
		<li><a href="${pageContext.request.contextPath}/home/db_test.do">
				MySQL에 데이터 입력하기</a></li>
	</ul>
</body>
</html>
