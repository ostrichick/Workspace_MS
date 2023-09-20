<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>회원가입</title>

<!-- BootStrap JS와 CSS CND 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</head>
<body>

<figure style="text-align:center;margin-top:100px;">
  <blockquote class="blockquote">
    <p>회 원 가 입</p>
  </blockquote>
</figure>

<form action="${pageContext.request.contextPath}/join_process.do" method="post">
<!-- 폼 입력값을 서버로 전송하면 서버에서는 DispatcherServlet이 요청을 받아서 HandlerMapping에게
     요청을 전달하고 HandlerMapping은 요청을 처리할 Controller가 어디인지 확인해서 그 정보를 DispatcherServlet에게
     보낸다. 그러면 DispatcherServlet은 받은 정보를 이용해서 요청을 처리할 Controller에게 요청을 보낸다.
     이 요청을 받은 Controller가 자신이 가지고 있는 요청처리 메소드를 실행시킴으로써 요청에 대해 처리한다. -->
	<div id="container" style="float:left;width:250px;">
	  <div class="row mb-3">
	    <div class="col-sm-15">
	      <input type="email" class="form-control" id="member_id" name="member_id" placeholder="아이디(email)">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <div class="col-sm-15">
	      <input type="password" class="form-control" id="member_pw" name="member_pw" placeholder="비밀번호">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <div class="col-sm-15">
	      <input type="password" class="form-control" id="member_pw2" name="member_pw2" placeholder="비밀번호 확인">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <div class="col-sm-15">
	      <input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름">
	    </div>
	  </div>
	  <div class="row mb-3">
	    <div class="col-sm-15">
	      <input type="phone" class="form-control" id="member_handphone" name="member_handphone" placeholder="핸드폰">
	    </div>
	  </div>
	  <div style="text-align:center;">
		  <input class="form-check-input" type="radio" name="member_gender" value="M" checked />
		  <label class="form-check-label">남자</label>&nbsp;&nbsp;
		  <input class="form-check-input" type="radio" name="member_gender" value="F"/>
		  <label class="form-check-label">여자</label>
	  </div>

	  <div style="margin:15px;">
		  <button type="submit" class="btn btn-primary">가입하기</button>&nbsp;&nbsp;
		  <button type="reset" class="btn btn-primary">취소하기</button>
      </div>
	</div>
	
</form>

<script>
	$(function(){//jQuery구문
		
		let width_str = $("#container").css("width");//px을 포함한 문자열 값 
		let div_container_width = parseInt(width_str.substring(0, width_str.indexOf('p')));
		//window.innerWidth-현재 브라우저 화면의 가로 크기 반환
		let margin_left = (window.innerWidth - div_container_width)/2;
		$("#container").css("margin-left", margin_left);
		
		$(window).on('resize', function(){//브라우저 화면 사이즈 변경때마다 호출
			margin_left = (window.innerWidth - div_container_width)/2;
			$("#container").css("margin-left", margin_left);
		});
		
	});
</script>



</body>
</html>