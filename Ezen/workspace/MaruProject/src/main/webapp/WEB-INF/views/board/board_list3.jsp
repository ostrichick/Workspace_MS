<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>

<!-- BootStrap JS와 CSS CND 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	body {margin:50px;width:900px;}
	h3, th {text-align: center;}
	a {text-decoration:none; color:black;font:bold 20px Arial, Sans-Serif;}
	a:hover {color:#FF8224;}
	.link_container {display:inline;text-align:left;}
	table {border-collapse:collapse;}
	th, td {border:solid 1px; padding:5px; width:150px; height:20px;}

</style>

</head>
<body>

<h3>게시글 목록</h3>
<hr>

<div class="link_container">
	
	<!--구분, 검색: bootstrap > components > dropdown, navbar -->
	<!-- 검색구분 카테고리 -->
	<div class="dropdown" style="float:left;">
		  <button id="search_type_btn" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		    구분
		  </button>
		  <ul class="dropdown-menu" >
		    <li><a id="type_all" class="dropdown-item" href="#">전체</a></li>
		    <li><a id="type_title" class="dropdown-item" href="#">제목</a></li>
		    <li><a id="type_area" class="dropdown-item" href="#">지역</a></li>
		  </ul>
	</div>
	
	<!-- 키워드 검색 -->
	<div class="container-fluid" style="float:left;width:400px;">
	    <form action="${pageContext.request.contextPath}/board/search_board.do" method="post" class="d-flex" role="search">
	      <input type="hidden" id="search_type" name="search_type" value="type_all"/>
	      <input  type="search" name="search_keyword" class="form-control me-2" placeholder="" aria-label="검색">
	      <button class="btn btn-outline-success" type="submit">Search</button>
	    </form>
	 </div>
	
		 
	 <div style="text-align:right">
		<!-- 글쓰기: bootstrap > icon > pencil-square -->
		<a href="${pageContext.request.contextPath}/board/board_write.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16" aria-label="글쓰기">
			  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
			  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
			</svg>
		</a>&nbsp;&nbsp;
		
		<!-- 홈: bootstrap > icon > house --> 
		<a href="${pageContext.request.contextPath}/home.do">
			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
			  <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
			  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
			</svg>
		</a>
	</div> 
	
</div>
<br>

<table>
	<tr>
		<th>작성자</th><th>제목</th><th>내용</th><th>주소</th><th>가격</th><th>작성일자</th>
	</tr>
	<c:choose>
		<c:when test="${empty boardList}">
			<tr><td colspan="6">게시글이 없습니다.</td></tr>
		</c:when>
		<c:otherwise>
				<c:forEach var="boardVo" items="${boardList}">
					<tr>
						<td>${boardVo.writer}</td><td>${boardVo.title}</td><td>${boardVo.content}</td>
						<td>${boardVo.address}</td><td>${boardVo.price}</td><td>${boardVo.reg_date}</td>
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