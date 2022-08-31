<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <form action="${pageContext.request.contextPath}/member/signup_process.do" method="post">
    <!-- 폼 입력값을 서버로 전송하면 서버에서는 DispatcherServlet이 요청을 받아서 HandlerMapping에게
     요청을 전달하고 HandlerMapping은 요청을 처리할 Controller가 어디인지 확인해서 그 정보를 DispatcherServlet에게
     보낸다. 그러면 DispatcherServlet은 받은 정보를 이용해서 요청을 처리할 Controller에게 요청을 보낸다.
     이 요청을 받은 Controller가 자신이 가지고 있는 요청처리 메소드를 실행시킴으로써 요청에 대해 처리한다. -->
    <div id="container" style="margin: 30px auto 0; width: 250px;">
      <div class="row mb-3">
        <div class="col-sm-15">
          <input type="text" class="form-control" id="member_id" name="member_id" placeholder="아이디">
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
          <input type="email" class="form-control" id="member_email" name="member_email" placeholder="이메일">
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-15">
          <input type="phone" class="form-control" id="member_phone" name="member_phone" placeholder="핸드폰">
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-15">
          <input type="text" class="form-control" id="member_addr" name="member_addr" placeholder="주소">
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-15">
          <input type="text" class="form-control" id="member_addr2" name="member_addr2" placeholder="상세주소">
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-sm-15">
          <input type="text" class="form-control" id="member_postcode" name="member_postcode" placeholder="우편번호">
        </div>
      </div>
      <div style="margin: 15px;">
        <button type="submit" class="btn btn-primary">가입하기</button>
        &nbsp;&nbsp;
        <button type="reset" class="btn btn-primary">취소하기</button>
      </div>
    </div>

  </form>
  <hr style="clear: both; visibility: hidden; margin: 0;">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      document.getElementById("member_addr").addEventListener("click", function() { //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
          oncomplete : function(data) { //선택시 입력값 세팅
            document.getElementById("member_addr").value = data.address; // 주소 넣기
            document.getElementById("member_postcode").value = data.zonecode; // 우편번호 넣기
            document.querySelector("input[name=member_addr2]").focus(); //상세입력 포커싱
          }
        }).open();
      });
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>