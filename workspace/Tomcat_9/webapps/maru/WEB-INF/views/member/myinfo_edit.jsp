<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <!-- 시작 -->
  <div class="container col-lg-6 col-md-8 col-sm-10 col-xs-12">
    <h3 class="m-tb-50 m-l-30">회원가입</h3>
    <form name="joinform" class="needs-validation bg2 text-black p-5 bor10 m-b-50" novalidate action="../member/updateinfo.do" method="post">
      <p>
        <label for="member_id"> 아이디 </label>
      </p>
      <div class="input-group mb-3">
        <input type="text" class="form-control " id="member_id" name="member_id" placeholder="아이디를 입력해주세요" value="${member_id }" readonly>
      </div>

      <div class="m-tb-20 signInMark">
        <p class="form-label">비밀번호</p>
        <input type="password" class="pw form-control" id="member_pw" name="member_pw" placeholder="비밀번호를 입력해주세요(6글자~16글자 이하[특수문자 포함])" required onchange="check_pw()" />
        <span id="pw"></span>
      </div>

      <div class="m-tb-20 signInMark">
        <p class="form-label">비밀번호 확인</p>
        <input type="password" class="pw form-control" id="member_pw2" name="member_pw2" placeholder="비밀번호 확인" required onchange="check_pw()" />
        <span id="check"></span>
      </div>

      <div class="m-tb-20">
        <p class="form-label">이름</p>
        <input type="text" class="form-control" required id="member_name" name="member_name" placeholder="이름을 입력해주세요" value="${member_name }" onKeyup="this.value=this.value.replace(/[^가-힣ㄱ-ㅎㅏ-ㅣ]/g,'');" readonly />
      </div>

      <p class="form-label">
        <label for="member_phone">휴대전화번호</label>
      </p>
      <div class="input-group mb-3">
        <input required type="text" class="form-control col-9" value="${memberInfoVo.member_phone}" id="member_phone" name="member_phone" placeholder="휴대전화번호를 입력해주세요" maxlength=12 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
        <input type="button" class="col-3 btn cl0 bg7" id="sendPhoneNumber" value="인증번호 전송">
      </div>

      <p class="form-label">
        <label for="inputCertifiedNumber">인증번호</label>
      </p>
      <div class="input-group mb-3">
        <input type="text" class="form-control" id="inputCertifiedNumber" placeholder="인증번호를 입력해주세요" required>
        <input type="button" class="col-3 btn cl0 bg7" id="checkBtn" value="인증번호 확인">
      </div>

      <div class="m-tb-20 has-feedback">
        <p class="form-label">이메일</p>
        <input type="email" required class="form-control" value="${memberInfoVo.member_email }" id="member_email" name="member_email" placeholder="이메일을 입력해주세요" />
      </div>

      <p class="form-label">
        <label for="member_addr">주소</label>
      </p>
      <div class="input-group mb-3">
        <input type="text" required value="${memberInfoVo.member_addr }" class="form-control col-md-9 float-left" id="member_addr" name="member_addr" placeholder="주소를 입력해주세요" readonly />
        <input type="button" id="member_addr_btn" class="col-3 btn cl0 bg7 float-right" value="주소찾기">
      </div>

      <div class="m-tb-20">
        <p class="form-label">상세주소</p>
        <input type="text" required value="${memberInfoVo.member_addr2 }" class="form-control" id="member_addr2" name="member_addr2" placeholder="상세주소를 입력해주세요" />
      </div>

      <div class="m-tb-20">
        <p class="form-label">우편번호</p>
        <input type="text" class="form-control" value="${memberInfoVo.member_postcode }" id="member_postcode" name="member_postcode" placeholder="우편번호" maxlength=5 readonly />
      </div>

      <div class="m-t-50 text-center">
        <button type="submit" class="btn btn-lg cl0 bg7" onclick="submitForm()">수정하기</button>
        <input type="button" id="deleteAccount" class="btn btn-lg cl0 bg1 m-lr-10" value="회원탈퇴">
        <input type="button" id="main_btn" class="btn btn-lg cl0 bg1" value="취소">
      </div>
    </form>
  </div>
  <!-- 회원가입 폼 끝 -->


  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      document.getElementById("member_addr_btn").addEventListener("click", function() { //주소입력칸을 클릭하면
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
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
  <script>
      $("#main_btn").on('click', function(event) {
        event.preventDefault();
        $(location).attr('href', "${pageContext.request.contextPath}/");
      });
      $("#deleteAccount").on('click', function(event) {
        event.preventDefault();
        $(location).attr('href', "${pageContext.request.contextPath}/member/deleteprocess");
      });
      //                         document.getElementById("main_btn").addEventListener("click", function() {
      //                           event.preventDefault();
      //                           location.href = "${pageContext.request.contextPath}/";
      //                         });
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      // 휴대폰 인증
      $("#sendPhoneNumber").click(function() {
        let phoneNumber = $("#member_phone").val();
        Swal.fire("인증번호 발송 완료!");
        $.ajax({
          type : "GET",
          url : "check/sendSMS",
          data : {
            phoneNumber : phoneNumber,
          },
          success : function(res) {
            $("#checkBtn").click(function() {
              if ($.trim(res) == $("#inputCertifiedNumber").val()) {
                Swal.fire("인증성공!", "휴대폰 인증이 정상적으로 완료되었습니다.", "success");
                $("#member_phone").attr("readonly", true);
                //             $.ajax({
                //               type: "GET",
                //               url: "update/phone",
                //               data: {
                //                 phoneNumber: $("#inputPhoneNumber").val(),
                //               },
                //             });
                //             document.location.href = "/home";
              } else {
                Swal.fire({
                  icon : "error",
                  title : "인증오류",
                  text : "인증번호가 올바르지 않습니다!",
                /* footer: '<a onClick="window.location.reload()">다시 인증하기</a>', */
                });
              }
            });
          },
        });
      });
    </script>
  <script>
      // Form 유효성 확인
      function submitForm() {
        "use strict";

        $("input").each(function(index, item) {
          $(item).val($(item).val().trim())
        })

        var forms = document.querySelectorAll(".needs-validation");

        Array.prototype.slice.call(forms).forEach(function(form) {
          form.addEventListener("submit", function(event) {
            if (!form.checkValidity()) {
              event.preventDefault();
              event.stopPropagation();
            }
            form.classList.add("was-validated");
          }, false);
        });
      }
    </script>
</body>
</html>