<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %> <!--  여기를 true로 바꿔주세요 !! -->
<html>
<head>
	<title>Home</title>
	<meta charset="UTF-8">
	<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
	<script>
		function disCheck(){
			alert($("#id").val());
			$.ajax({
				url:"disCheck.do",
				type:"get",
				data:"id="+$("#id").val(),
				success:function(data){
					//alert(data);
				}
			});
		}
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<c:if test="${login eq null}">
	<p> 로그인 후 이용하세요</p>
	<a href="join.do">회원가입</a> |
	<a href="login.do">로그인</a> 
</c:if>

<c:if test="${ login ne null }">
	<p> ${login.mid }님 환영합니다</p>
	<a href="logout.do">로그아웃</a> |
	<a href="mypage.do">마이페이지</a> |
</c:if>
<br>
<a href="board/list.do">게시판 바로가기</a>|
<!-- 
로그인한 유저의 id가 admin인 경우에만 노출되는 링크
회원조회 바로가기 링크 클릭시 member 테이블에 있는 전체 데이터를 출력하는 화면을 구현하세요.
 -->
 
<c:if test="${login.mid eq 'admin' }">
	<a href="member/list.do">회원조회 바로가기</a>
</c:if>

<br>
<a href="ajax/home.do">ajax 연습 페이지 바로가기</a>
<a href="ajax2/home.do">ajax 연습 페이지2 바로가기</a>
<br>
<a href="file/fileUplodPage.do">파일 업로드 예제 바로가기</a>

<input type="text" id="id">
<button onclick="disCheck()">확인</button>
</body>
</html>






