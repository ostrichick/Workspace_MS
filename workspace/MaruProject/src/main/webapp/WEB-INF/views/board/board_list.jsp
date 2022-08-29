<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유마켓</title>

<!-- BootStrap JS와 CSS CND 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
	figure {text-align:center;height:100px;padding-top:30px;margin:0;}
	div#container {float:left;width:750px;margin:0;}
	thead {position:sticky;top:0;background:white;}
	a {text-decoration:none;color:black;}
	tr :hover {color:black;} <!-- tr태그의 하위 태그에 마우스가 올라갈 때 스타일 적용 -->
</style>

</head>
<body>

<figure>
  <blockquote class="blockquote">
    <p><span style="font:bold 30px Arial, Consolas;">자 유 마 켓</span></p>
  </blockquote>
</figure>

	<div id="container">

		<table class="table">
  			<thead>
			    <tr>
			      	<th scope="col" style="text-align:right">
			      		<!-- 검색구분 카테고리 -->
			      		<div class="dropdown">
						  <button id="search_type_btn" class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    검색구분
						  </button>
							  <ul class="dropdown-menu" >
							    <li><a id="type_all" class="dropdown-item" href="#">전체내용</a></li>
							    <li><a id="type_title" class="dropdown-item" href="#">제목</a></li>
							    <li><a id="type_area" class="dropdown-item" href="#">지역</a></li>
							  </ul>
						</div>
					</th>
					<th scope="col" style="width:300px;">	
			      	  <!-- 키워드 검색 -->
			      	  <div class="container-fluid">
					    <form action="${pageContext.request.contextPath}/board/search_board.do" method="post" class="d-flex" role="search">
					      <input type="hidden" id="search_type" name="search_type" value="type_all"/>
					      <input  type="search" name="search_keyword" class="form-control me-2" placeholder="" aria-label="검색">
					      <button class="btn btn-outline-success" type="submit">Search</button>
					    </form>
					  </div>
			      </th>
			      
			      <th scope="col" style="text-align:right;">
			      		<!-- 글쓰기 표시 -->
			      		<a href="${pageContext.request.contextPath}/board/insert_product.do">
			      			<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16" aria-label="글쓰기">
							  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
							  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
							</svg>
			      		</a>&nbsp;&nbsp;&nbsp;
			      		
			      		<!-- 홈 표시 -->
			      		<a href="${pageContext.request.contextPath}/home.do">
			      		<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-house" viewBox="0 0 16 16">
						  <path fill-rule="evenodd" d="M2 13.5V7h1v6.5a.5.5 0 0 0 .5.5h9a.5.5 0 0 0 .5-.5V7h1v6.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5zm11-11V6l-2-2V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5z"/>
						  <path fill-rule="evenodd" d="M7.293 1.5a1 1 0 0 1 1.414 0l6.647 6.646a.5.5 0 0 1-.708.708L8 2.207 1.354 8.854a.5.5 0 1 1-.708-.708L7.293 1.5z"/>
						</svg>
						</a>&nbsp;&nbsp;&nbsp;			      		
			      </th>
			    </tr>
			</thead>
			
			<tbody>
			
			<!-- 반복 부분 -->
			<jsp:useBean id="now" class="java.util.Date" />
			
			<c:forEach var="boardVo" items="${boardList}">
					<tr>
				      <th scope="row" colspan="2" style="width:400px;text-align:center;">
					      <!-- 제품상세 페이지로 이동 -->
				    	  <a href="${pageContext.request.contextPath}/board/product/${boardVo.board_idx}">
				    	  
				    	  	<c:choose>
				    	  		<c:when test="${not empty boardVo.origin_filename1}">
				    	  			<img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename1}" 
										 style="width:300px;height:200px;"/>
				    	  		</c:when>
				    	  		<c:when test="${not empty boardVo.origin_filename2}">
				    	  			<img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename2}" 
										 style="width:300px;height:200px;"/>
				    	  		</c:when>
				    	  		<c:when test="${not empty boardVo.origin_filename3}">
				    	  			<img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.origin_filename3}" 
										 style="width:300px;height:200px;"/>
				    	  		</c:when>
				    	  	</c:choose>
					      	
						  </a>
				      </th>
				      <td>
					      <!-- 제품상세 페이지로 이동 -->
					      <a href="${pageContext.request.contextPath}/board/product/${boardVo.board_idx}">
					      	<span style="font:bold 23px Arial, Consolas;">${boardVo.title}</span><br><br> 
					      	<span style="font-size:17px;">${boardVo.address}</span> | <fmt:formatDate value="${boardVo.reg_date}" pattern="MM월 dd일 HH시 mm분"/><br><br>
					      	<span style="font:bold 19px Arial, Consolas;"><fmt:formatNumber value="${boardVo.price}" groupingUsed="true"/>원</span>
				      	  </a>
				      </td>
				    </tr>
			    	
			</c:forEach>
			    
			</tbody>
		</table>

	</div>
	

	<script>
		$(function(){//jQuery구문
			
			/////// 내용을 화면 가운데 위치시키는 구문 ///////
		
			let width_str = $("#container").css("width");//px을 포함한 문자열 값 
			let div_container_width = parseInt(width_str.substring(0, width_str.indexOf('p')));
			//window.innerWidth-현재 브라우저 화면의 가로 크기 반환
			let margin_left = (window.innerWidth - div_container_width)/2;
			$("#container").css("margin-left", margin_left);
			
			$(window).on('resize', function(){//브라우저 화면 사이즈 변경때마다 호출
				margin_left = (window.innerWidth - div_container_width)/2;
				$("#container").css("margin-left", margin_left);
			});
			
			
			/////// 검색구분 드롭다운 메뉴 처리 구문 ///////
			$(".dropdown-item").on("click", function(){
				//1. 선택한 검색구분을 버튼의 텍스트에 넣어줌
				let selected_type = $(this).text();
				$("#search_type_btn").text(selected_type);
				
				//2. Search 버튼 클릭시 서버로 전송되도록 
				//  <input type="hidden" id="search_type" name="search_type" value=""/> 에 세팅함
				let search_type = $(this).attr("id");//전체내용:type_all, 제목:type_title, 지역:type_area
				$("#search_type").val(search_type);
				
			})
			
		});
	</script>

</body>
</html>