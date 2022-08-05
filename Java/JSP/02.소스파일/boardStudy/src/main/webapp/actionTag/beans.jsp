<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet" type="text/css">
<style>
	section{
		height:400px;
	} 
</style> 
</head>
<body>
	<%@include file="/include/header.jsp" %>
	<section>
		<h2>jsp 액션태그 beans 관련</h2>
		<jsp:useBean id="user1" class="boardStudy.User" scope="request"/>
		<jsp:setProperty name="user1" property="id" value="홍길동" />
		id : <jsp:getProperty name="user1" property="id"/>
		<!-- 
			useBean 태그를 사용하여 user2 자바빈즈를 생성하세요.
			이때 id:tester2, name:테스터2, password:1234, addr:전주시, uidx:2
			값을 갖도록 해주시고 해당 데이터를 전부 출력하세요.
		
		 -->
		 
		 <jsp:useBean id="user2" class="boardStudy.User" scope="page"/>
		 <jsp:setProperty name="user2" property="id" value="tester2" />
		 <jsp:setProperty name="user2" property="name" value="테스터2" />
		 <jsp:setProperty name="user2" property="password" value="1234" />
		 <jsp:setProperty name="user2" property="addr" value="전주시" />
		 <jsp:setProperty name="user2" property="uidx" value="2" />
		 
		 <jsp:getProperty name="user2" property="id"/>
		 <jsp:getProperty name="user2" property="name"/>
		 <jsp:getProperty name="user2" property="password" />
		 <jsp:getProperty name="user2" property="addr"/>
		 <jsp:getProperty name="user2" property="uidx" />
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>




