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
  <figure style="text-align: center; margin-top: 100px;">
    <blockquote class="blockquote">
      <p>로 그 인</p>
    </blockquote>
  </figure>

  <form action="${pageContext.request.contextPath}/member/signin_process.do" method="post">

    <div id="container" style="margin: 0 auto 30px; width: 250px;">
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
      <div style="margin-top: 10px;">
        <button type="submit" class="btn btn-primary" style="width: 250px">로그인</button>
      </div>
    </div>
  </form>
  <hr style="clear: both; visibility: hidden; margin: 0;">

  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>