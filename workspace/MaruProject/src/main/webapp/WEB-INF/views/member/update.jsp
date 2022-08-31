<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>

<!-- BootStrap JS와 CSS CND 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<!--  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

</head>
<body>

  <figure style="text-align: center; margin-top: 100px;">
    <blockquote class="blockquote">
      <p>회 원 정 보</p>
    </blockquote>
  </figure>

  <div id="container" class="container text-center" style="width: 470px">

    <form id="frm" action="${pageContext.request.contextPath}/update_process.do" method="post">
      <div class="row g-2">
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">이름</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_name" value="${memberVo.member_name}" />
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">아이디(이메일)</div>
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
            <input type="text" name="member_pw" value="${memberVo.member_pw}" />
          </div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light" style="height: 48px;">핸드폰번호</div>
        </div>
        <div class="col-6">
          <div class="p-2 border bg-light">
            <input type="text" name="member_handphone" value="${memberVo.member_handphone}" />
          </div>
        </div>
      </div>

      <div style="margin: 15px;">
        <button type="submit" class="btn btn-primary">수정하기</button>
        &nbsp;&nbsp;
        <input type="button" id="main_btn" class="btn btn-primary" value="메인화면">
        <script>
                  $("#main_btn").on('click', function(event) {
                    event.preventDefault();
                    $(location).attr('href', "${pageContext.request.contextPath}/");
                  });
                </script>
      </div>
    </form>



  </div>

  <script>
      $(function() {//jQuery구문

        let width_str = $("#container").css("width");//px을 포함한 문자열 값 
        let div_container_width = parseInt(width_str.substring(0, width_str.indexOf('p')));
        //window.innerWidth-현재 브라우저 화면의 가로 크기 반환
        let margin_left = (window.innerWidth - div_container_width) / 2;
        $("#container").css("margin-left", margin_left);

        $(window).on('resize', function() {//브라우저 화면 사이즈 변경때마다 호출
          margin_left = (window.innerWidth - div_container_width) / 2;
          $("#container").css("margin-left", margin_left);
        });
      });
    </script>



</body>
</html>