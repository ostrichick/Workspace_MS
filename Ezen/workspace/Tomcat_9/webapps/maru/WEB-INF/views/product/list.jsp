
<!-- SweetAlert 수정할 것 --><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>제품 목록</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<style>
span.cart_plus:hover {
  color: #333;
}

span.cart_plus>i:hover {
  width: 110%;
}
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>

  <!-- Product -->
  <div class="bg0 m-t-23 p-b-140">
    <div class="container">
      <div class="flex-w flex-sb-m p-b-52">
        <div class="flex-w flex-c-m m-tb-10">
          <div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
            <i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i> <i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i> 필터
          </div>

          <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
            <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i> <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i> 검색
          </div>
        </div>

        <div class="flex-w flex-l-m filter-tope-group m-tb-10">
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">전체</button>
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".livingroom">거실</button>
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bedroom">침실</button>
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".library">서재</button>
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".kitchen">주방</button>
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".bathroom">욕실</button>
          <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".etcproduct">기타</button>
        </div>

        <!-- Search product -->
        <div class="dis-none panel-search w-full p-t-10 p-b-15">
          <div class="bor8 dis-flex p-l-15">
            <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
              <i class="zmdi zmdi-search"></i>
            </button>
            <form action="${MaruContextPath}/product/list?search=" method="get">
              <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="product_name" placeholder="검색어를 입력해주세요.">
            </form>
          </div>
        </div>

        <!-- Filter -->
        <div class="dis-none panel-filter w-full p-t-10">
          <div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
            <div class="filter-col1 p-r-15 p-b-27">
              <div class="mtext-102 cl2 p-b-15">정렬하기</div>

              <ul>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list" class="filter-link stext-106 trans-04"> 기본값 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?orderBy=popular" class="filter-link stext-106 trans-04"> 인기순 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?orderBy=avgstar" class="filter-link stext-106 trans-04"> 평점순 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?orderBy=newitem" class="filter-link stext-106 trans-04 filter-link-active"> 신상품 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?orderBy=lowprice" class="filter-link stext-106 trans-04"> 낮은 가격순 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?orderBy=highprice" class="filter-link stext-106 trans-04"> 높은 가격순 </a></li>
              </ul>
            </div>

            <div class="filter-col2 p-r-15 p-b-27">
              <div class="mtext-102 cl2 p-b-15">가격</div>

              <ul>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list" class="filter-link stext-106 trans-04 filter-link-active"> 전체 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?priceRange=lt50k" class="filter-link stext-106 trans-04"> ₩0 - ₩50,000 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?priceRange=50kTo100k" class="filter-link stext-106 trans-04"> ₩50,000 - ₩100,000 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?priceRange=100kTo200k" class="filter-link stext-106 trans-04"> ₩100,000 - ₩200,000 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?priceRange=200kTo500k" class="filter-link stext-106 trans-04"> ₩200,000 - ₩500,000 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?priceRange=500kTo1m" class="filter-link stext-106 trans-04"> ₩500,000 - ₩1,000,000 </a></li>
                <li class="p-b-6"><a href="${MaruContextPath}/product/list?priceRange=gt1m" class="filter-link stext-106 trans-04"> ₩1,000,000 이상 </a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <div class="row isotope-grid">

        <c:forEach var="product" items="${productList}" varStatus="status">
          <div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ${product.product_major_category }">

            <!-- Block2 -->
            <div class="block2">
              <div class="block2-pic hov-img0">
                <a href="detail?product_idx=${product.product_idx}" class="stext-104 cl4 hov-cl1 trans-04 p-b-6"> <c:choose>
                    <c:when test="${empty product.file_original}">
                      <img src="https://place-hold.it/270x270" alt="IMG-PRODUCT">
                    </c:when>
                    <c:otherwise>
                      <img src="${MaruContextPath}/resources/upload/s_${product.file_original}" alt="IMG-PRODUCT">
                    </c:otherwise>
                  </c:choose>

                </a>
              </div>
              <div class="block2-txt flex-w flex-t p-t-14">
                <div class="block2-txt-child1 flex-col-l ">
                  <a href="detail?product_idx=${product.product_idx}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6"> ${product.product_name} </a>
                  <%--                   <span class="stext-105 cl3"><fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" /> </span> --%>

                  <c:choose>
                    <c:when test="${product.product_sale eq 'Y' and product.product_sale_percent gt 0 }">
                      <del>
                        <fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" />
                      </del>
                      <fmt:formatNumber value="${product.product_sale_percent / 100 }" type="percent" />
                      <span class="stext-105 cl3"> <fmt:formatNumber value="${product.product_price - product.product_price * product.product_sale_percent/100}" type="currency" currencySymbol="₩" />
                      </span>
                    </c:when>
                    <c:otherwise>
                      <!-- 할인을 안 할 경우 정상가격 표시 -->
                      <span class="stext-105 cl3"> <fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" />
                      </span>
                    </c:otherwise>
                  </c:choose>

                  <span class="fs-18 cl11"> <c:choose>
                      <c:when test="${ product.product_avgstar ge 4.8}">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 4.3 and product.product_avgstar lt 4.8 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-half"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 3.8 and product.product_avgstar lt 4.3 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 3.3 and product.product_avgstar lt 3.8 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-half"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 2.8 and product.product_avgstar lt 3.3 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 2.3 and product.product_avgstar lt 2.8 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-half"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 1.8 and product.product_avgstar lt 2.3 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 1.3 and product.product_avgstar lt 1.8 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-half"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar ge 0.8 and product.product_avgstar lt 1.3 }">
                        <i class="zmdi zmdi-star"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:when test="${ product.product_avgstar gt 0 and product.product_avgstar lt 0.8 }">
                        <i class="zmdi zmdi-star-half"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                        <i class="zmdi zmdi-star-outline"></i>
                      </c:when>
                      <c:otherwise></c:otherwise>
                    </c:choose>
                  </span>
                </div>
                <div class="block2-txt-child2 flex-r p-t-15">
                  <a onClick="fn_addCart(${product.product_idx}, '${product.product_name}')" href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2"><span class="cl3 trans-04 cart_plus"><i class="zmdi zmdi-shopping-cart-plus zmdi-hc-2x mdc-text-grey"></i></span> </a>

                </div>
              </div>
            </div>
          </div>
        </c:forEach>


      </div>
      <!-- Load more -->
      <!--       <div class="flex-c-m flex-w w-full p-t-45"> -->
      <!--         <a href="#" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04"> 더 불러오기 </a> -->
      <!--       </div> -->
    </div>
  </div>
  <script>
  function fn_addCart(idx, product_name) {
    //idx 값에는 product_idx가 담김. 장바구니 버튼 위치 line 096

    let cart_product_number = 1; // 담을 물건 숫자
        
    $.ajax({
      type: "post",
      url: "${MaruContextPath}/cart/add_process?product_idx=" + idx + "&cart_product_number=" + cart_product_number,
      data: {
        product_idx: idx,
        cart_product_number: cart_product_number,
      },
      success: function () {
        Swal.fire(product_name, "장바구니에 추가되었습니다!", "success");
      },
      error: function () {
        alert("실패");
      },
    });
  }
</script>


  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>