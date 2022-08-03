<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 Bean 사용</title>
</head>
<body>
	<h2>자바 Bean 사용</h2>
	ezen.spring.vo 패키지에 BoardVo클래스를 정의하되 멤버변수는 writer, title, content를 갖도록
	정의

	<!-- 스크립틀릿 이용한 방법 -->
	<%@ page import="ezen.spring.vo.BoardVo"%>
	<%
	BoardVo boardVo = new BoardVo();
	boardVo.setWriter("홍길동");
	boardVo.setTitle("홍길동전");
	boardVo.setContent("홍길동의 의적활동");
	%>

	<!-- 자바빈 이용한 방법 -->
	<jsp:useBean id="boardVo2" class="ezen.spring.vo.BoardVo"></jsp:useBean>
	<jsp:setProperty property="writer" name="boardVo2" value="이순신" />
	<jsp:setProperty property="title" name="boardVo2" value="난중일기" />
	<jsp:setProperty property="content" name="boardVo2" value="전쟁 중에 쓴 기록" />

	<h2>게시글(BoardVo) 내용</h2>
	작성자:
	<%=boardVo.getWriter()%>
	<br> 제목 :
	<%=boardVo.getTitle()%>
	<br> 내용 :
	<%=boardVo.getContent()%>
	<br>

	<h2>게시글(BoardVo2) 내용</h2>
	작성자: ${boardVo2.writer}
	<br> 제목 : ${boardVo2.title}
	<br> 내용 : ${boardVo2.content}
	<br>

</body>
</html>