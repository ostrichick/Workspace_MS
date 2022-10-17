<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>주문 상세 내역</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${MaruContextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <!-- breadcrumb -->
  <div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
      <a href="${MaruContextPath}/" class="stext-109 cl8 hov-cl1 trans-04"> 메인화면 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
      </a> <a href="${MaruContextPath}/member/myinfo" class="stext-109 cl8 hov-cl1 trans-04"><span class="stext-109 cl4"> 내 정보 </span> <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a> <a href="${MaruContextPath}/member/myinfo#order_list" class="stext-109 cl8 hov-cl1 trans-04"><span class="stext-109 cl4"> 주문 목록 </span> <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a> <span class="stext-109 cl4"> 주문 상세 내역 </span>
    </div>
  </div>

  <!-- Shoping Cart -->
  <section class="container">
    <form class="m-b-50">
      <h3 class="m-tb-50 m-l-50">주문 상세 내역</h3>
      <div class="wrap-table-shopping-cart">
        <table class="table-shopping-cart txt-center">
          <tr class="table_head">
            <th class="col-1">선택</th>
            <th class="col-8" colspan="2">상품</th>
            <th class="col-2 p-r-10">가격</th>
            <th class="col-1">수량</th>
          </tr>

          <tr class="table_row">
            <td class="">
              <div class="form-check">
                <input class="input-lg form-check-input dis-inline-block" type="checkbox" value="" id="delete_item" checked>
              </div>
            </td>
            <td class="">
              <div class="">
                <img class="img-fluid img-thumbnail" src="${pageContext.request.contextPath}/resources/images/product-01.jpg" width="150" alt="IMG">
              </div>
            </td>
            <td class=" txt-left">제품명ㅇㅇㅇㅇ ㅇㅇㅇㅇㅇ</td>
            <td class=" txt-right p-r-10">1,380,000원</td>
            <td class="">1</td>
          </tr>

          <tr class="table_row">
            <td class="">
              <div class="form-check">
                <input class="form-check-input dis-inline-block" type="checkbox" value="" id="delete_item" checked>
              </div>
            </td>
            <td class="">
              <div class="">
                <img class="img-fluid img-thumbnail" src="${pageContext.request.contextPath}/resources/images/product-01.jpg" width="150" alt="IMG">
              </div>
            </td>
            <td class=" txt-left">제품명ㅇㅇㅇㅇ ㅇㅇㅇㅇㅇㅇㅇ ㅇㅇㅇㅇ</td>
            <td class=" txt-right p-r-10">180,000원</td>
            <td class="">2</td>
          </tr>
        </table>
      </div>


      <div class="bg8 text-dark p-l-150 p-tb-40 fs-18 ">
        <p class="fs-20 p-tb-10">
          <strong>[ 주문내역 ]</strong>
        </p>
        <table class="txt-right table-hover">
          <tr>
            <td>주문금액 :</td>
            <td>180,000원</td>
          </tr>
          <tr>
            <td>배송비 :</td>
            <td>2,500원</td>
          </tr>
          <tr>
            <td>총주문금액 :</td>
            <td>182,500원</td>
          </tr>
        </table>
      </div>
      <div class="mt-5 txt-center">
        <a href="order_refund?order_idx=" type="button" class="btn bg7 cl7 btn-outline-dark btn-lg m-lr-30">선택 상품 환불/결제 취소</a>
<!--         <button type="button" class="btn bg7 cl7 btn-outline-dark btn-lg m-lr-30">선택 상품 교환</button> -->
      </div>
    </form>
    <!-- ==================== -->
    <section class="col-6 m-lr-auto p-all-20 m-tb-50 cl6 bg2">
      <h3 class="mt-5">배송정보</h3>
      <hr>
      <div class="">
        <p class="form-label">수령인</p>
        <p class="form-control">홍길동</p>
      </div>
      <br>
      <div class="">
        <p class="form-label">연락처</p>
        <p class="form-control">010-1111-1111</p>

      </div>
      <br>
      <div class="">
        <p class="form-label">배송주소</p>
        <p class="form-control">전라북도 전주시 덕진구</p>
        <p class="form-control">백제대로 342</p>
        <p class="form-control">54915</p>

      </div>
      <br>
      <div class="">
        <p class="form-label">결제방식</p>
        <p class="form-control">신용카드</p>
      </div>
      <br>
      <div class="">
        <p class="form-label">배송일자</p>
        <p class="form-control">2022.08.25</p>
      </div>
    </section>
  </section>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>