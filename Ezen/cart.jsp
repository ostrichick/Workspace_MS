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
    
    -->
<!--===============================================================================================-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
  <form class="container m-b-50">
    <h3 class="m-tb-50 m-l-50">장바구니</h3>
    <div class="wrap-table-shopping-cart">
      <table class="table-shopping-cart txt-center">
        <tr class="table_head">
          <th class="">선택</th>
          <th colspan="2" class="">상품</th>
          <th class="">가격</th>
          <th class="">수량선택</th>
          <th class=""></th>
        </tr>
        <c:forEach var="cart" items="${cartList}" varStatus="status">
          <c:if test="${empty cartList  }">
            <tr class="table_row">
              <td class="">장바구니가 비어있습니다. 상품을 추가해주세요.</td>
            </tr>
          </c:if>
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
                  <fmt:formatNumber value="${cart.product_price - cart.product_price * cart.product_sale_percent/100}" type="currency" currencySymbol="₩" />
                </c:when>

                <c:otherwise>
                  <!-- 할인을 안 할 경우 정상가격 표시 -->
                  <fmt:formatNumber value="${cart.product_price }" type="currency" currencySymbol="₩" />
                </c:otherwise>
              </c:choose>
            </td>

            <td class="">
              <div class="wrap-num-product flex-w m-auto">

                <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                  <i class="fs-16 zmdi zmdi-minus"></i>
                </div>
                <input class="mtext-104 cl3 txt-center num-product" type="number" name="cart_product_number" value="${cart.cart_product_number }" oninput="updateCart(this.value,${cart.product_idx })">
                <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                  <i class="fs-16 zmdi zmdi-plus"></i>
                </div>

              </div>
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
        <!-- 위의 표로부터 합계 계산하여 실시간으로 금액 변하게하는 JS 함수 필요 -->
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
      <button id="linkToOrder" type="button" class="btn btn-lg bg7 cl7 btn-outline-secondary">상품 구매</button>
      <button id="linkToMain" type="button" class="btn bg2 cl2 ml-5 btn-outline-secondary">계속 쇼핑하기</button>
    </div>
  </form>
  <script>
      document.querySelector("#linkToOrder").addEventListener("click", fn_linkToOrder);
      function fn_linkToOrder() {
        let url = "${MaruContextPath}/order/order?cart_idx=";
        //         url += idx; // fn_linkToOrder() 인자를 cart_idx 로 받아서 url에 더할 것
        location.href = url;
      }

      document.querySelector("#linkToMain").addEventListener("click", fn_linkToMain);
      function fn_linkToMain() {
        location.href = "${MaruContextPath}/";
      }

      let product_number = document.querySelectorAll("input.num-product");

      //       product_number.addEventListener("input", updateCart)

      function updateCart(cart_product_number, product_idx) {
        console.log("oninput 작동")

        $.ajax({
          type : "post",
          url : "${MaruContextPath}/cart/updateCart?product_idx=" + product_idx + "&cart_product_number=" + cart_product_number,
          data : {
            "product_idx" : product_idx,
            "cart_product_number" : cart_product_number
          },
          success : function() {
            alert("성공");
            console.log(data);
          },
          error : function() {
            alert("실패");
            console.log(data);
          },
        })
      }
      
      function deleteCart(product_idx, obj){
        $.ajax({
          type : "post",
          url : "${MaruContextPath}/cart/deleteCart?product_idx=" + product_idx,
          data : {
            "product_idx" : product_idx,
          },
          success : function() {
            alert("성공");
            console.log(this);
            console.log(obj);
            $(obj).parent().parent().remove();
            console.log(data);
            reloadCart();
          },
          error : function() {
            console.log(data);
            alert("실패");
          },
        })
      }
        
      
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>