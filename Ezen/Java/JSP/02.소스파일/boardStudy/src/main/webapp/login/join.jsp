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
		<h2>회원가입</h2>
		<form action="join_action.jsp" method="post">
			<p>
				<label>id : <input type="text" name="id" required></label>
			</p> 
			<p>
				<label>password : <input type="password" name="password" required></label>
			</p>
			<p>
				<label>name : <input type="text" name="name" required></label>
			</p>
			<p>
				<label>addr : <input type="text" name="addr"></label>
			</p>
			<p>
				<input type="submit" value="회원가입">
			</p>
		</form>
	</section>
	<%@include file="/include/footer.jsp" %>
	
	
</body>
</html>