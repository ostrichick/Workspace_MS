<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<h4>판매 물품 올리기</h4>
	<form
		action="${pageContext.request.contextPath}/board/insert_process.do"
		method="post" enctype="multipart/form-data">

		주소
		<p>
			<input type="text" name="board_addr" />
		</p>
		가격
		<p>
			<input type="number" name="board_price" />
		</p>
		제목
		<p>
			<input type="text" name="board_title" />
		</p>
		내용
		<p>
			<textarea name="board_content" rows="" cols=""></textarea>
		</p>
		<p>
			<input type="file" name="uploadFile" multiple />
		</p>
		<p>
			<input type="submit" value="업로드" />
		</p>
	</form>
	<hr />
	<h4>업로드된 게시물</h4>
	<%-- <c:forEach var="fileVo" items="${fileList }"> --%>
</body>
</html>