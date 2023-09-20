<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>아이디 / 비밀번호 찾기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <h2 class="m-tb-50 txt-center">아이디 / 비밀번호 찾기</h2>
  <div class="container bor10 col-lg-5 col-md-6 col-sm-8 col-xs-10 p-all-30">
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
        <a href="#" class="btn bg2 cl6 btn-dark col-12"> 아이디/비밀번호 찾기 </a>
      </div>
    </div>
  </div>


  <div class="full">
    <div class="container">
      <div class="area_inputs wow fadeIn">
        <div class="sub_title font-weight-bold cl3">
          <h3>아이디/비밀번호 찾기</h3>
          <p class="cl3">인증된 이메일만 정보 찾기가 가능합니다 :)</p>
        </div>
        <div style="margin-bottom: 10px;" class="custom-control custom-radio custom-control-inline">
          <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
          <label class="custom-control-label font-weight-bold " for="search_1">아이디 찾기</label>
        </div>
        <div class="custom-control custom-radio custom-control-inline">
          <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)">
          <label class="custom-control-label font-weight-bold " for="search_2">비밀번호 찾기</label>
        </div>
        <div id="searchI">
          <div class="form-group">
            <label class="font-weight-bold " for="inputName_1">이름</label>
            <div>
              <input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 갓민수">
            </div>
          </div>
          <div class="form-group">
            <label class="font-weight-bold " for="inputPhone_1">휴대폰번호</label>
            <div>
              <input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 01077779999">
            </div>
          </div>
          <div class="form-group">
            <button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
            <a class="btn btn-danger btn-block" href="${pageContext.request.contextPath}">취소</a>
          </div>
        </div>
        <div id="searchP" style="display: none;">
          <div class="form-group">
            <label class="font-weight-bold " for="inputId">아이디</label>
            <div>
              <input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) godmisu">
            </div>
          </div>
          <div class="form-group">
            <label class="font-weight-bold " for="inputEmail_2">이메일</label>
            <div>
              <input type="email" class="form-control" id="inputEmail_2" name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
            </div>
          </div>
          <div class="form-group">
            <button id="searchBtn2" type="button" class="btn btn-primary btn-block">확인</button>
            <a class="btn btn-danger btn-block" href="${pageContext.request.contextPath}">취소</a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Modal -->
  <div id="background_modal" class="background_modal">
    <div class="modal_contents">
      <h4>
        <b>손님 아이디는?</b><span class="close">&times;</span>
      </h4>
      <br>
      <h2 id="id_value"></h2>
      <br>
      <button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
        <i class="fa fa-envelope"></i>비밀번호 찾기
      </button>
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

      function search_check(num) {
        if (num == '1') {
          document.getElementById("searchP").style.display = "none";
          document.getElementById("searchI").style.display = "";
        } else {
          document.getElementById("searchI").style.display = "none";
          document.getElementById("searchP").style.display = "";
        }
      }

      $(document).ready(function() {
        /////////모///달///기///능///////////
        // 1. 모달창 히든 불러오기
        $('#searchBtn').click(function() {
          $('#background_modal').show();
        });
        // 2. 모달창 닫기 버튼
        $('.close').on('click', function() {
          $('#background_modal').hide();
        });
        // 3. 모달창 위도우 클릭 시 닫기
        $(window).on('click', function() {
          if (event.target == $('#background_modal').get(0)) {
            $('#background_modal').hide();
          }
        });
      });

      // 아이디 & 스토어 값 저장하기 위한 변수
      var idV = "";
      // 아이디 값 받고 출력하는 ajax
      var idSearch_click = function() {
        $.ajax({
          type : "POST",
          url : "${pageContext.request.contextPath}/user/userSearch?inputName_1=" + $('#inputName_1').val() + "&inputPhone_1=" + $('#inputPhone_1').val(),
          success : function(data) {
            if (data == 0) {
              $('#id_value').text("회원 정보를 확인해주세요!");
            } else {
              $('#id_value').text(data);
              // 아이디값 별도로 저장
              idV = data;
            }
          }
        });
      }
    </script>
</body>
</html>