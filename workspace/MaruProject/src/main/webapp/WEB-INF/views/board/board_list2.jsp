<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>

<h3>게시글 목록</h3>
<hr>

<div>
	<a href="${pageContext.request.contextPath}/board/board_write.do">
		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
		  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
		  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
		</svg>
	</a>
</div>

<table>
	<tr>
		<th>작성자</th><th>제목</th><th>내용</th><th>주소</th><th>가격</th><th>작성일자</th>
	</tr>
	
	<c:choose>
		<c:when test="${empty boardList}">
			<tr>
				<td colspan="6">게시글이 없습니다...</td>
			</tr>
		</c:when>
		<c:otherwise>
		
			<!-- BoardController에서 Model객체에 boardList속성으로 저장한 객체에서 BoardVo객체를 하나씩
			     가지고 와서 화면에 내용을 구성하시오.  -->
			<c:forEach var="boardVo" items="${boardList}">
			
				<tr>
					<td>${boardVo.writer}</td><td>${boardVo.title}</td>
					<td>${boardVo.content}</td><td>${boardVo.address}</td>
					<td>${boardVo.price}</td><td>${boardVo.reg_date}</td>
				</tr>
				<tr>
					<td colspan="6">
						<img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename1}" />
						<img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename2}" />
						<img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename3}" />
					</td>
				</tr>
				
			</c:forEach>
		
		</c:otherwise>	
	</c:choose>


</table>



</body>
</html>