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
  <!-- 시작 -->
  <div class="container col-lg-6 col-md-8 col-sm-10 col-xs-12">
    <h3 class="m-tb-50 m-l-30">회원가입</h3>
    <form name="joinform" class="needs-validation bg2 text-black p-5 bor10 m-b-50" novalidate action="${pageContext.request.contextPath}/member/signup_process" method="post">
      <p>
        <label for="member_id"> 아이디 </label>
      </p>
      <div class="input-group mb-3">
        <input type="text" class="form-control col-9" id="member_id" name="member_id" placeholder="아이디를 입력해주세요" required onKeyup="this.value=this.value.replace( /^[a-z|A-Z]+$/g,'');">
        <input class="btn btn-outline-secondary cl0 bg7 col-3" type="button" id="duplicateCheck" value="중복확인" onclick="fn_idDuplicateChk()">
        <div class="valid-feedback">유효한 아이디 입니다.</div>
        <div class="invalid-feedback">6글자 이상 20글자 이하로 작성 후 중복확인을 해주세요.</div>
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
        <input type="text" class="form-control" required id="member_name" name="member_name" placeholder="이름을 입력해주세요" onKeyup="this.value=this.value.replace(/[^가-힣ㄱ-ㅎㅏ-ㅣ]/g,'');" />
      </div>

      <p class="form-label">
        <label for="member_phone">휴대전화번호</label>
      </p>
      <div class="input-group mb-3">
        <input required type="text" class="form-control col-9" id="member_phone" name="member_phone" placeholder="휴대 전화번호 를 입력해주세요" maxlength=12 onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" />
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
        <input type="email" required class="form-control" id="member_email" name="member_email" placeholder="이메일을 입력해주세요" />
      </div>

      <p class="form-label">
        <label for="member_addr">주소</label>
      </p>
      <div class="input-group mb-3">
        <input type="text" required class="form-control col-md-9 float-left" id="member_addr" name="member_addr" placeholder="주소를 입력해주세요" readonly />
        <input type="button" id="member_addr_btn" class="col-3 btn cl0 bg7 float-right" value="주소찾기">
      </div>

      <div class="m-tb-20">
        <p class="form-label">상세주소</p>
        <input type="text" required class="form-control" id="member_addr2" name="member_addr2" placeholder="상세주소를 입력해주세요" />
      </div>

      <div class="m-tb-20">
        <p class="form-label">우편번호</p>
        <input type="text" class="form-control" id="member_postcode" name="member_postcode" placeholder="우편번호" maxlength=5 readonly />
      </div>

      <div class="m-t-50 text-center">
        <button type="submit" class="btn btn-lg cl0 bg7 m-r-30" onclick="submitForm()">가입하기</button>
        <input type="reset" class="btn btn-lg cl0 bg1" value="취소">
      </div>
    </form>
  </div>
  <!-- 회원가입 폼 끝 -->


  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      // 카카오 지도 API
      document.getElementById("member_addr_btn").addEventListener("click", kakaoAddress)
      document.getElementById("member_addr").addEventListener("click", kakaoAddress);
      document.getElementById("member_postcode").addEventListener("click", kakaoAddress);
      function kakaoAddress() {
        //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
          oncomplete : function(data) {
            //선택시 입력값 세팅
            document.getElementById("member_addr").value = data.address; // 주소 넣기
            document.getElementById("member_postcode").value = data.zonecode; // 우편번호 넣기
            document.querySelector("input[name=member_addr2]").focus(); //상세입력 포커싱
          },
        }).open();
      }
    </script>


  <!-- <script>
  function check_pw() {
    var pw = document.getElementById("member_pw").value;
    var SC = ["!", "@", "#", "$", "%", "~"];
    var check_SC = 0;

    if (pw.length < 6 || pw.length > 16) {
      document.getElementById("pw").innerHTML = "비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.";
      document.getElementById("pw").style.color = "red";
      document.getElementById("member_pw").value = "";
    } else {
      document.getElementById("pw").style.color = "green";
      document.getElementById("pw").innerHTML = "";
    }
    for (var i = 0; i < SC.length; i++) {
      if (pw.indexOf(SC[i]) != -1) {
        check_SC = 1;
      }
    }
    if (check_SC == 0) {
      document.getElementById("pw").innerHTML = "!,@,#,$,%,~ 의 특수문자가 들어가 있지 않습니다.";
      document.getElementById("pw").style.color = "red";
      document.getElementById("member_pw").value = "";
    } else {
      document.getElementById("pw").style.color = "green";
      document.getElementById("pw").innerHTML = "";
    }
    if (document.getElementById("member_pw").value != "" && document.getElementById("member_pw2").value != "") {
      if (document.getElementById("member_pw").value == document.getElementById("member_pw2").value) {
        document.getElementById("check").innerHTML = "비밀번호가 일치합니다.";
        document.getElementById("check").style.color = "green";
      } else {
        document.getElementById("check").innerHTML = "비밀번호가 일치하지 않습니다.";
        document.getElementById("check").style.color = "red";
      }
    }
  }
</script>
-->
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      let isMember_idValid = false;

      document.querySelector("#member_id").addEventListener("input", function() {
        isNotDuplicated = false;
      });
      document.querySelector("#member_id").addEventListener("input", checkId);
      function checkId() {

        //1. 입력한 value 값을 읽어온다.
        let member_id = document.querySelector("#member_id").value;
        //2. 유효성(5글자이상 10글자 이하)을 검증한다.
        isMember_idValid = member_id.length >= 8 && member_id.length <= 20;
        //3. 유효하다면 input 요소에 is-valid 클래스 추가, 아니라면 is-invalid 클래스 추가

        if (isMember_idValid && isNotDuplicated === true) {
          document.querySelector("#member_id").classList.remove("is-invalid");
          document.querySelector("#member_id").classList.add("is-valid");
        } else {
          document.querySelector("#member_id").classList.remove("is-valid");
          document.querySelector("#member_id").classList.add("is-invalid");
        }
      }
    </script>
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
      let isNotDuplicated = false;

      // 아이디 중복확인
      function fn_idDuplicateChk() {
        if ($("#member_id").val() !== "" || $("#member_id").val() === undefined) {
          isDuplicated = false;
          $.ajax({
            url : "check/idDuplicate",
            type : "post",
            dataType : "json",
            data : {
              "member_id" : $("#member_id").val()
            },
            success : function(data) {
              if (data == 1) {
                Swal.fire("중복된 아이디입니다.");
                isNotDuplicated = false;
                checkId();
              } else if (data == 0) {
                $("#member_id").attr("value", "Y");
                Swal.fire("사용가능한 아이디입니다.");
                isNotDuplicated = true;
                checkId();
              }
            }
          })
        }
      }
    </script>
  <script>
      // Form 유효성 확인
      function submitForm() {
        "use strict";

        $("input").each(function(index, item) {
          $(item).val($(item).val().trim())
        })

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll(".needs-validation");

        // Loop over them and prevent submission
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