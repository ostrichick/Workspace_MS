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
<%@ include file="/include/header.jsp" %>
	<section>
		<h2>게시글 등록 페이지 입니다.</h2>
		
		<form action="insert_action.jsp" method="post">
		
			<table border="1" width="500">
				<tr>
					<th align="right">제목</th>
					<td><input type="text" name="title" size="50"></td>
				</tr>
				<tr height="200">
					<th align="right">내용</th>
					<td><textarea name="content" rows="10" cols="50"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="저장">
		</form>
		
	</section>
	<%@ include file="/include/footer.jsp" %>
</body>
</html>