<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>마루 </title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!--===============================================================================================-->
<link rel="icon" type="image/png" href="${MaruContextPath}/resources/images/icons/favicon.png" />
<!--===============================================================================================-->
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <!-- Slider -->
  <section class="section-slide">
    <div class="wrap-slick1">
      <div class="slick1">
        <div class="item-slick1" style="background-image: url(${MaruContextPath}/resources/images/slide-01.jpg)">
          <div class="container h-full">
            <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
              <div class="layer-slick1 animated visible-false" data-appear="fadeInDown" data-delay="0">
                <span class="ltext-101 cl2 respon2"> 2022년 가을 신상품 </span>
              </div>

              <div class="layer-slick1 animated visible-false" data-appear="fadeInUp" data-delay="800">
                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">행거</h2>
              </div>

              <div class="layer-slick1 animated visible-false" data-appear="zoomIn" data-delay="1600">
                <a href="${MaruContextPath}/product/list" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"> 지금 구매 </a>
              </div>
            </div>
          </div>
        </div>

        <div class="item-slick1" style="background-image: url(${MaruContextPath}/resources/images/slide-02.jpg)">
          <div class="container h-full">
            <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
              <div class="layer-slick1 animated visible-false" data-appear="rollIn" data-delay="0">
                <span class="ltext-101 cl2 respon2"> 2층 침대 </span>
              </div>

              <div class="layer-slick1 animated visible-false" data-appear="lightSpeedIn" data-delay="800">
                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">......</h2>
              </div>

              <div class="layer-slick1 animated visible-false" data-appear="slideInUp" data-delay="1600">
                <a href="${MaruContextPath}/product/list" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"> 지금 구매 </a>
              </div>
            </div>
          </div>
        </div>

        <div class="item-slick1" style="background-image: url(${MaruContextPath}/resources/images/slide-03.jpg)">
          <div class="container h-full">
            <div class="flex-col-l-m h-full p-t-100 p-b-30 respon5">
              <div class="layer-slick1 animated visible-false" data-appear="rotateInDownLeft" data-delay="0">
                <span class="ltext-101 cl2 respon2"> 와이드 소파 </span>
              </div>

              <div class="layer-slick1 animated visible-false" data-appear="rotateInUpRight" data-delay="800">
                <h2 class="ltext-201 cl2 p-t-19 p-b-43 respon1">......</h2>
              </div>

              <div class="layer-slick1 animated visible-false" data-appear="rotateIn" data-delay="1600">
                <a href="${MaruContextPath}/product/list" class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04"> 지금구매 </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Banner -->
  <div class="sec-banner bg0 p-t-80 p-b-50">
    <div class="container">
      <div class="p-b-10">
        <h3 class="ltext-103 cl5">할인 중인 제품</h3> product_sale eq 'Y' 인 아이템들 List로 가져와서 하나씩 진열
      </div>
      <div class="row">
        <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
          <!-- Block1 -->
          <div class="block1 wrap-pic-w">
            <img src="${MaruContextPath}/resources/images/banner-01.jpg" alt="IMG-BANNER" /> <a href="${MaruContextPath}/product/list" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
              <div class="block1-txt-child1 flex-col-l">
                <span class="block1-name ltext-102 trans-04 p-b-8"> 부엌장 </span> <span class="block1-info stext-102 trans-04"> 2022년 가을 </span>
              </div>

              <div class="block1-txt-child2 p-b-4 trans-05">
                <div class="block1-link stext-101 cl0 trans-09">지금 구매</div>
              </div>
            </a>
          </div>
        </div>

        <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
          <!-- Block1 -->
          <div class="block1 wrap-pic-w">
            <img src="${MaruContextPath}/resources/images/banner-02.jpg" alt="IMG-BANNER" /> <a href="${MaruContextPath}/product/list" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
              <div class="block1-txt-child1 flex-col-l">
                <span class="block1-name ltext-102 trans-04 p-b-8"> 세면대 </span> <span class="block1-info stext-102 trans-04"> 2022년 여름 </span>
              </div>

              <div class="block1-txt-child2 p-b-4 trans-05">
                <div class="block1-link stext-101 cl0 trans-09">지금 구매</div>
              </div>
            </a>
          </div>
        </div>

        <div class="col-md-6 col-xl-4 p-b-30 m-lr-auto">
          <!-- Block1 -->
          <div class="block1 wrap-pic-w">
            <img src="${MaruContextPath}/resources/images/banner-03.jpg" alt="IMG-BANNER" /> <a href="${MaruContextPath}/product/list" class="block1-txt ab-t-l s-full flex-col-l-sb p-lr-38 p-tb-34 trans-03 respon3">
              <div class="block1-txt-child1 flex-col-l">
                <span class="block1-name ltext-102 trans-04 p-b-8"> 식탁 의자 세트 </span> <span class="block1-info stext-102 trans-04"> 2022년 여름 </span>
              </div>

              <div class="block1-txt-child2 p-b-4 trans-05">
                <div class="block1-link stext-101 cl0 trans-09">지금 구매</div>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Product -->
 

  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>

</body>
</html>
