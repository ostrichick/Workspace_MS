<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <h2 class="m-tb-50 txt-center">Maru</h2>
  <div class="container bor10 bg6 col-lg-5 col-md-6 col-sm-8 col-xs-10 p-all-30 m-b-50">
    <div class="container">
      <form class="needs-validation" novalidate action="${pageContext.request.contextPath}/member/signin_process" method="post">
        <div class="bor8 m-b-20 how-pos4-parent">
          <input class="form-control" type="text" id="member_id" name="member_id" placeholder="아이디를 입력해주세요" required>
        </div>
        <div class="bor8 m-b-20 how-pos4-parent">
          <input class="form-control" type="password" id="member_pw" name="member_pw" placeholder="패스워드를 입력해주세요" required>
        </div>
        <div class="m-t-30 txt-center">
          <button type="submit" class="btn btn-outline-secondary bg7 cl7 col-12">로그인</button>
        </div>
      </form>
      <div class="m-t-20 txt-center">
        <a href="${MaruContextPath}/member/signup" class="btn bg2 cl6 btn-dark col-12">회원가입</a>
      </div>
      <div class="m-t-20 txt-center">
        <a href="../member/find" class="btn bg2 cl6 btn-dark col-12"> 아이디/비밀번호 찾기 </a>
      </div>
    </div>
  </div>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      // Form 유효성 확인
      (function() {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function(form) {
          form.addEventListener('submit', function(event) {
            if (!form.checkValidity()) {
              event.preventDefault()
              event.stopPropagation()
            }

            form.classList.add('was-validated')
          }, false)
        })
      })()
    </script>
</body>
</html>