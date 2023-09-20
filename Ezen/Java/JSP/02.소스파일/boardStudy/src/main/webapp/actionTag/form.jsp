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
		<h2>jsp 액션태그 beans parameter</h2>
		<form action="parameter.jsp" method="get">
			<p>
				id : <input type="text" name="id">
			</p>
			<p>
				name : <input type="text" name="name">
			</p>
			<p>
				password : <input type="password" name="password">
			</p>
			<p>
				addr : <input type="text" name="addr">
			</p>
			<p>
				test : <input type="text" name="test">
			</p>
			<p>
				<input type="submit" value="전송">
			</p>
		</form>
	</section>
	<%@include file="/include/footer.jsp" %>
</body>
</html>