<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>결제 완료</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${MaruContextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <section class="container m-lr-auto m-tb-50">
    <h3 class="m-all-20">결제 완료</h3>
    <hr />
    <p class="bg7 cl7 txt-center col-6 p-3 fs-20 m-lr-auto rounded">구매가 정상적으로 완료되었습니다.</p>
    <br>
    <!--  -->
    <table class="table col-6 m-lr-auto txt-center">
      <tr class="table_head">
        <th class="col-4">주문번호</th>
        <th class="col-4">총결제금액</th>
        <th class="col-4">결제방법</th>
      </tr>

      <tr class="table_row">
        <td class="imp_uid">주문번호</td>
        <td class="paid_amount">총결제금액</td>
        <td class="pay_method">결제방법</td>
      </tr>

    </table>

    <div class="txt-center m-tb-20">
      <a href="#" type="button" class="btn bg7 cl7">구매내역확인</a> <a href="#" type="button" class="btn bg7 cl7 ml-5">쇼핑계속하기</a>
    </div>
  </section>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      let rsp = '${rsp}';
      let JSONrsp = JSON.parse(rsp);
      $(".imp_uid").html(JSONrsp.imp_uid);
      $(".paid_amount").html(JSONrsp.paid_amount + "원");
      $(".pay_method").html(JSONrsp.card_name);
    </script>
</body>
</html>