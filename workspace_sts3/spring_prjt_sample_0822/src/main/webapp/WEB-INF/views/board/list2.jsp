<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유마켓 목록</title>
</head>
<body>
	<h4>업로드된 게시물</h4>
	<a href="${pageContext.request.contextPath}/board/insert.do">글쓰기</a>
	<table border="1" style="border-collapse: collapse;">
		<tr>
			<th>사진</th>
			<th>제목</th>
			<th>내용</th>
			<th>주소</th>
			<th>가격</th>
		</tr>
		<c:forEach var="boardVo" items="${boardList }">
			<tr>
				<td><img
					src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename1}"
					style="width: 300px; height: 200px;"></td>
				<td>${boardVo.board_title }</td>
				<td>${boardVo.board_content}</td>
				<td>${boardVo.board_addr}</td>
				<td>${boardVo.board_price}</td>
			</tr>
		</c:forEach>
	</table>
	<hr />
	<!-- 	<h4>판매 물품 올리기</h4> -->
	<!-- 	<form -->
	<%-- 		action="${pageContext.request.contextPath}/board/insert_process.do" --%>
	<!-- 		method="post" enctype="multipart/form-data"> -->

	<!-- 		주소 -->
	<!-- 		<p> -->
	<!-- 			<input type="text" name="board_addr" /> -->
	<!-- 		</p> -->
	<!-- 		가격 -->
	<!-- 		<p> -->
	<!-- 			<input type="number" name="board_price" /> -->
	<!-- 		</p> -->
	<!-- 		제목 -->
	<!-- 		<p> -->
	<!-- 			<input type="text" name="board_title" /> -->
	<!-- 		</p> -->
	<!-- 		내용 -->
	<!-- 		<p> -->
	<!-- 			<textarea name="board_content" rows="" cols=""></textarea> -->
	<!-- 		</p> -->
	<!-- 		<p> -->
	<!-- 			<input type="file" name="uploadFile" multiple /> -->
	<!-- 		</p> -->
	<!-- 		<p> -->
	<!-- 			<input type="submit" value="업로드" /> -->
	<!-- 		</p> -->
	<!-- 	</form> -->
</body>
</html>