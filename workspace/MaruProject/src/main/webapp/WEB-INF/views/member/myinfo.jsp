<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <figure style="text-align: center; margin-top: 100px;">
    <blockquote class="blockquote">
      <p>회 원 정 보</p>
    </blockquote>
  </figure>
  <div id="container" class="container text-center" style="width: 470px">
    <form id="frm" action="${pageContext.request.contextPath}/member/updateinfo.do" method="post">
      <div class="row g-2">
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">아이디</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">
            <input type="hidden" name="member_id" value="${member_id}" />${member_id}</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">비밀번호</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="password" name="member_pw" value="${memberInfoVo.member_pw}" />
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">이름</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="hidden" name="member_name" value="${memberInfoVo.member_name}" />${memberInfoVo.member_name}
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">이메일</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_email" value="${memberInfoVo.member_email}" />
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">핸드폰번호</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_phone" value="${memberInfoVo.member_phone}" />
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">주소</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_addr" id="member_addr" value="${memberInfoVo.member_addr}" />
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">상세 주소</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_addr2" id="member_addr2" value="${memberInfoVo.member_addr2}" />
          </div>
        </div>

        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">우편번호</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_postcode" id="member_postcode" value="${memberInfoVo.member_postcode}" />
          </div>
        </div>
        <div style="margin: 15px;">
          <button type="submit" class="btn btn-primary">수정하기</button>
          &nbsp;&nbsp;
          <input type="button" id="deleteAccount" class="btn btn-primary" value="회원탈퇴">
          &nbsp;&nbsp;
          <input type="button" id="main_btn" class="btn btn-primary" value="메인화면">
        </div>
      </div>
    </form>
  </div>
  <hr style="clear: both; visibility: hidden; margin: 0;">
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
      document.getElementById("member_addr").addEventListener("click", function() {
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
        $(location).attr('href', "${pageContext.request.contextPath}/member/deleteprocess.do");
      });
      //                         document.getElementById("main_btn").addEventListener("click", function() {
      //                           event.preventDefault();
      //                           location.href = "${pageContext.request.contextPath}/";
      //                         });
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>