<!-- 장바구니 페이지

프론트) product_idx와 cart_product_number를 이용해 카트 테이블과 상품 테이블을 조인시켜서 상품가격을 가져오고
product_number의 값을 올리고 내릴때마다 JS 이벤트를 사용해 실시간으로 해당품목 가격합과 장바구니 금액 총합을 구한다 

백엔드)
    1. 쓰기 : product/detail 에서 처리

    2. 보기 :
      a) 로그인시 -> db로 부터 값을 불러와 출력
        -> db에서 member_idx가 일치하는 회원의 cartVo를 List로 담아서 가져옴
        -> List안의 CartVo를 하나씩 출력
        -> 조건문을 이용해 List<CartVo>가 비어있을 경우 장바구니가 비어있습니다 메세지 출력
      b) 비로그인시 -> 쿠키로부터 값을 불러와 출력
          
    3. 수정 :
      a) 로그인시 -> db와 통신하여 update 쿼리로 수량 변경
      b) 비로그인시 -> 쿠키를 갱신하여 수량 변경 
    
    4. 삭제 : 
      1) ajax로 해당 member_idx와 product_idx값을 DB로 보내서 해당 품목을 삭제
      2) ajax 통신 성공시 해당 품목의 <tr>태그를 삭제
    
    -->
<!--===============================================================================================-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>장바구니</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>

  <!-- breadcrumb -->
  <div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
      <a href="${MaruContextPath}/" class="stext-109 cl8 hov-cl1 trans-04"> 메인화면 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
      </a> <span class="stext-109 cl4"> 장바구니 </span>
    </div>
  </div>

  <!-- Shoping Cart -->
  <form class="container m-b-50" action="${MaruContextPath}/order/order" method="post">
    <h3 class="m-tb-50 m-l-50">장바구니</h3>
    <div class="wrap-table-shopping-cart">
      <table class="table-shopping-cart txt-center">
        <tr class="table_head">
          <th class="col-1">전체선택<br> <input class="form-check form-check-inline m-r-0" type="checkbox" id="checkboxSelectAll" checked />
          </th>
          <th colspan="2" class="">상품</th>
          <th class="col-1">가격</th>
          <th class="col-2">수량선택</th>
          <th class="col-1">금액 합계</th>
          <th class="col-1"></th>
        </tr>
        <c:if test="${empty cartList  }">
          <tr class="table_row">
            <td colspan="6" class="">장바구니가 비어있습니다. 상품을 추가해주세요.</td>
          </tr>
        </c:if>
        <c:forEach var="cart" items="${cartList}" varStatus="status">
          <tr class="table_row">
            <td class="">
              <div class="form-check">
                <input class="d-none" type="checkbox" name="checkedItemList" value="${cart.cart_idx}" id="cart_idx" checked>
                <input class="form-check-input dis-inline-block" type="checkbox" name="product_idx_list" value="${cart.product_idx}" onchange="checkedItem(${cart.product_idx}, this)" checked>
              </div>
            </td>
            <td class="col-3">
              <img class="img-fluid img-thumbnail" src="${pageContext.request.contextPath}/resources/images/product-01.jpg" width="150" alt="IMG">
            </td>
            <td class="txt-left">
              <a href="${MaruContextPath}/product/detail?product_idx=${cart.product_idx}">${cart.product_name }</a>
            </td>
            <td class="txt-right p-r-20">

              <c:choose>
                <c:when test="${cart.product_sale eq 'Y' and cart.product_sale_percent gt 0 }">
                  <del>
                    <fmt:formatNumber value="${cart.product_price }" type="currency" currencySymbol="₩" />
                  </del>
                  <br>
                  <c:set var="saledPrice" value="${cart.product_price - cart.product_price * cart.product_sale_percent/100}" />
                  <fmt:formatNumber value="${saledPrice}" type="currency" currencySymbol="₩" />
                </c:when>

                <c:otherwise>
                  <!-- 할인을 안 할 경우 정상가격 표시 -->
                  <c:set var="saledPrice" value="${cart.product_price}" />
                  <fmt:formatNumber value="${saledPrice }" type="currency" currencySymbol="₩" />
                </c:otherwise>
              </c:choose>
              <input type="hidden" value="${saledPrice}" />
            </td>

            <td class="">
              <div class="wrap-num-product flex-w m-auto">
                <input type="hidden" value="${cart.product_idx }">
                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                  <i class="fs-16 zmdi zmdi-minus"></i>
                </div>
                <input class="mtext-104 cl3 txt-center num-product testinput" type="number" name="cart_product_number" value="${cart.cart_product_number }" oninput="updateCart(this, this.value, ${cart.product_idx })">
                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                  <i class="fs-16 zmdi zmdi-plus"></i>
                </div>
              </div>
            </td>

            <td class="txt-right p-r-20 saledPrice">
              <fmt:formatNumber value="${saledPrice * cart.cart_product_number}" type="currency" currencySymbol="₩" />
              <input class="saledXNumber" type="hidden" value="${saledPrice * cart.cart_product_number}">
            </td>

            <td class="">
              <button type="button" class="btn bg1 cl7 btn-outline-dark" onclick="deleteCart(${cart.product_idx }, this)">삭제</button>
            </td>
          </tr>
        </c:forEach>

      </table>
    </div>

    <div class="bg8 text-dark p-l-150 p-tb-40 fs-18 ">
      <p class="fs-20 p-tb-10">
        <strong>[ 주문내역 ]</strong>
      </p>
      <table class="txt-right table-hover">
        <tr class="">
          <td class="p-r-10">주문금액 :</td>
          <td class="sumPrice1">
            <c:set var="sumPrice" value="0" />
            <c:forEach var="cart" items="${cartList}" varStatus="status">
              <c:choose>
                <c:when test="${cart.product_sale eq 'Y' and cart.product_sale_percent gt 0 }">
                  <c:set var="sumPrice" value="${sumPrice + (cart.product_price - cart.product_price * cart.product_sale_percent/100) * cart.cart_product_number}" />
                </c:when>
                <c:otherwise>
                  <c:set var="sumPrice" value="${sumPrice + cart.product_price * cart.cart_product_number}" />
                </c:otherwise>
              </c:choose>
            </c:forEach>
            <fmt:formatNumber value="${sumPrice }" type="currency" currencySymbol="₩" />
          </td>
        </tr>
        <tr>
          <td class="p-r-10">배송비 :</td>
          <td class="DeliveryFee">
            <c:choose>
              <c:when test="${sumPrice lt 50000 and sumPrice ne 0 }">
                <c:set var="deliveryFee" value="5000" />
                <fmt:formatNumber value="${deliveryFee }" type="currency" currencySymbol="₩" />
              </c:when>
              <c:otherwise>
                <c:set var="deliveryFee" value="0" />
                <fmt:formatNumber value="${deliveryFee }" type="currency" currencySymbol="₩" />
              </c:otherwise>
            </c:choose>
          </td>
        </tr>
        <tr>
          <td class="p-r-10">총주문금액 :</td>
          <td class="TotalPrice">
            <fmt:formatNumber value="${sumPrice + deliveryFee }" type="currency" currencySymbol="₩" />
            <input type="hidden" name="order_total_price" value="${sumPrice + deliveryFee }" />
          </td>
        </tr>
      </table>
    </div>
    <div class="mt-5 txt-center">
      <input type="hidden" name="member_idx" value="${saledPrice}" />
      <input id="linkToOrder" type="submit" class="btn btn-lg bg7 cl7 btn-outline-secondary" value="상품 구매">
      <button id="linkToProductList" type="button" class="btn bg2 cl2 ml-5 btn-outline-secondary">계속 쇼핑하기</button>
    </div>
  </form>
  <!-- 
  //장바구니에서 order 테이블로 넘길 정보 
  member_idx -> 폼으로 넘기고 컨트롤러에서 다시 검증
  order_total_price 
  selectKey로 order_idx 반환
  
  order_product 로 넘길 정보
  위에서 반환 받은 order_idx 키,
  product_idx (from cart_product_idx)
  order_quantity (from cart_product_number)
  
  -->
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
  /** 
  장바구니 페이지에서는 수량 변경, 삭제, 구매를 할 수 있음
  
  수량 변경시 : 오른쪽 금액합계 부분과 아래쪽 주문내역 총금액합계 부분을 변경
  삭제시 : 해당 <tr>행을 삭제하고 주문내역 총금액합계부분을 변경
  */
  
//   document.querySelector("#linkToOrder").addEventListener("click", fn_linkToOrder);
//   function fn_linkToOrder() {
//     let url = "${MaruContextPath}/order/order?cart_idx=";
//     //         url += idx; // fn_linkToOrder() 인자를 cart_idx 로 받아서 url에 더할 것
//     location.href = url;
//   }

      /* 전체선택 박스를 누르고 해제할 때 마다 모든 체크박스 선택 및 해제 */
      $("#checkboxSelectAll").on("change", function () {
        let isChecked = $("#checkboxSelectAll").is(":checked");
        if (isChecked){
          $(".table-shopping-cart input[type=checkbox]").each(function(index, item){
            $(item).prop("checked", true);
          })
        }else{
          $(".table-shopping-cart input[type=checkbox]").each(function(index, item){
            $(item).prop("checked", false);
          })
        }
        saledXNumberUpdate();
      });

      document.querySelector("#linkToProductList").addEventListener("click", fn_linkToMain);
      function fn_linkToMain() {
        location.href = "${MaruContextPath}/product/list";
      }

      /* 왼쪽 개별 체크박스를 선택해제할때마다 금액 합계 재계산 */
      function checkedItem(product_idx, obj) {
        if (obj.checked) {
          let saledPrice = $(obj).parent().parent().next().next().next().children("input[type=hidden]").val();
          let cart_product_number = $(obj).parent().parent().next().next().next().next().children().children("input[type=number]").val();
          let saledXNumber = saledPrice * cart_product_number;
          $(obj)
            .parent()
            .parent()
            .next()
            .next()
            .next()
            .next()
            .next()
            .html("₩" + saledXNumber.toLocaleString() + "<input class='saledXNumber' type='hidden' value='" + saledXNumber + "'>");
          $(obj).prev().prop("checked", true);
          $(obj).parent().parent().next().next().next().next().children().children("input[type=number]").attr("disabled", false);
        } else {
          $(obj)
            .parent()
            .parent()
            .next()
            .next()
            .next()
            .next()
            .next()
            .html("₩" + "0".toLocaleString() + "<input class='saledXNumber' type='hidden' value='" + 0 + "'>");
          $(obj).prev().prop("checked", false);
          $(obj).parent().parent().next().next().next().next().children().children("input[type=number]").attr("disabled", true);
        }
        totalPriceCalc();
      }
            
      /* 우측에 할인된금액x갯수 결과를 갱신하는 함수 */
      function saledXNumberUpdate(){
        $("input[name=product_idx_list]").each(function(index, obj){
        if (obj.checked) {
          let saledPrice = $(obj).parent().parent().next().next().next().children("input[type=hidden]").val();
          let cart_product_number = $(obj).parent().parent().next().next().next().next().children().children("input[type=number]").val();
          let saledXNumber = saledPrice * cart_product_number;
          $(obj)
            .parent()
            .parent()
            .next()
            .next()
            .next()
            .next()
            .next()
            .html("₩" + saledXNumber.toLocaleString() + "<input class='saledXNumber' type='hidden' value='" + saledXNumber + "'>");
          $(obj).prev().prop("checked", true);
          $(obj).parent().parent().next().next().next().next().children().children("input[type=number]").attr("disabled", false);
        } else {
          $(obj)
            .parent()
            .parent()
            .next()
            .next()
            .next()
            .next()
            .next()
            .html("₩" + "0".toLocaleString() + "<input class='saledXNumber' type='hidden' value='" + 0 + "'>");
          $(obj).prev().prop("checked", false);
          $(obj).parent().parent().next().next().next().next().children().children("input[type=number]").attr("disabled", true);
        }
       });
       totalPriceCalc();
      }
      
      /* 숫자를 변경할때마다 변경된 물품 갯수를 DB에 갱신 */
      function updateCart(obj, cart_product_number, product_idx) {
        $.ajax({
          type: "post",
          url: "${MaruContextPath}/cart/updateCart?product_idx=" + product_idx + "&cart_product_number=" + cart_product_number,
          data: {
            product_idx: product_idx,
            cart_product_number: cart_product_number,
          },
          success: function () {
            console.log("성공");
            let saledPrice = $(obj).parent().parent().prev().children("input[type=hidden]").val();
            let saledXNumber = saledPrice * cart_product_number;
            $(obj)
              .parent()
              .parent()
              .next()
              .html("₩" + saledXNumber.toLocaleString() + "<input class='saledXNumber' type='hidden' value='" + saledXNumber + "'>");
            totalPriceCalc();
          },
          error: function () {
            alert("실패");
          },
        });
      }
 
      /* 총금액 합계 부분을 갱신하는 함수 */
      function totalPriceCalc() {
        let sumSaledXNumber = 0;
        $(".saledXNumber").each(function (index, item) {
          sumSaledXNumber += parseInt(item.value);
        });
        $(".sumPrice1").html("₩" + sumSaledXNumber.toLocaleString());

        let deliveryFee = 0;
        if (sumSaledXNumber < 50000 && sumSaledXNumber != 0) {
          deliveryFee = 5000;
        }

        let totalPrice = sumSaledXNumber + deliveryFee;
        $(".DeliveryFee").html("₩" + deliveryFee.toLocaleString());
        $(".TotalPrice").html("₩" + totalPrice.toLocaleString());
        $(".TotalPrice").append("<input type='hidden' name='order_total_price' value=" + totalPrice + "/>");

        if (totalPrice == 0) {
          // 합계 금액이 0이면 구매버튼 비활성화
          $("#linkToOrder").addClass("disabled");
          $("#linkToOrder").prop("type", "button");
        } else {
          $("#linkToOrder").removeClass("disabled");
          $("#linkToOrder").prop("type", "submit");
        }
      }

      /* 삭제버튼을 누르면 해당 장바구니항목 DB에서 삭제하고 성공시 화면에서도 삭제 */
      function deleteCart(product_idx, obj) {
        $.ajax({
          type: "post",
          url: "${MaruContextPath}/cart/deleteCart?product_idx=" + product_idx,
          data: {
            product_idx: product_idx,
          },
          success: function () {
            alert("성공");
            let tr_list_length = document.querySelectorAll(".table-shopping-cart tr").length;
            if (tr_list_length > 2) {
              $(obj).parent().parent().remove();
            } else {
              $(obj).parent().parent().parent().append("<tr class='table_row'><td colspan='6' class=''>장바구니가 비었습니다.</td></tr>");
              $(obj).parent().parent().remove();
            }
            totalPriceCalc();
          },
          error: function () {
            console.log(data);
            alert("실패");
          },
        });
      }

      /* 장바구니 화면 새로고침 */
//       function reloadCart() {
//         $.ajax({
//           url: "${MaruContextPath}/cart/reloadCart",
//           type: "post",
//           success: function (data) {
//             alert(data.id);
//             console.log(data);
//           },
//           error: function () {
//             alert("error");
//           },
//         });
//       }
    </script>

</body>
</html>