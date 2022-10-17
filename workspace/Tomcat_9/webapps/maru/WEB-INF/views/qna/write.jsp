<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<title>이메일 문의</title>
<style>
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <div class="container col-6">
    <h3 class="m-tb-20">이메일 문의</h3>
    <div class="">
      자주 묻는 질문란에서 해결하지 못한 의문이 있으신가요?<br> 이메일문의를 남겨주시면 친절히 답변해드리겠습니다.<br> 평균 답변 시간:2~3일
    </div>
  </div>
  <div class="container bor7 m-t-20 m-b-100 p-all-50 bg2 col-6">
    <form action="send" method="post" class="">
      <div class="mb-3">
        <label class="form-label">이메일 주소</label>
        <input type="email" class="form-control" name="member_email" placeholder="답변 받을 이메일 주소를 입력해주세요." value="${member_email }">
      </div>
      <div class="mb-3">
        <label class="form-label">내용</label>
        <textarea class="form-control" name="content" rows="3"></textarea>
      </div>
      <div class="m-t-30 txt-center">
        <input type="hidden" name="member_idx" value="${sessionScope.member_idx}">
        <button class="cl0 btn btn-dark bg1 m-r-30" id="qna_submit" type="submit">전송하기</button>
        <a href="${MaruContextPath}/" class="btn bg2 cl2 btn-outline-dark" type="button" id="cancel">취소</a>
      </div>
    </form>
  </div>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      const mailSendResult = "${mailSendResult}"
      if (mailSendResult !== '') {
        alert(mailSendResult);
      }
    </script>
</body>
</html>