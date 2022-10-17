<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>${product.product_name}&nbsp;-&nbsp;상품상세보기</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${MaruContextPath}/resources/images/icons/favicon.png" />
<style>
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>

  <!-- 경로 -->
  <div class="container">
    <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
      <a href="${MaruContextPath}/" class="stext-109 cl8 hov-cl1 trans-04"> 전체 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
      </a>
      <c:choose>
        <c:when test="${product.product_major_category eq 'livingroom'}">
          <a href="${MaruContextPath}/product/list" class="stext-109 cl8 hov-cl1 trans-04"> 거실 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a>
        </c:when>
        <c:when test="${product.product_major_category eq 'bedroom'}">
          <a href="${MaruContextPath}/product/list" class="stext-109 cl8 hov-cl1 trans-04"> 침실 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a>
        </c:when>
        <c:when test="${product.product_major_category eq 'library'}">
          <a href="${MaruContextPath}/product/list" class="stext-109 cl8 hov-cl1 trans-04"> 서재 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a>
        </c:when>
        <c:when test="${product.product_major_category eq 'kitchen'}">
          <a href="${MaruContextPath}/product/list" class="stext-109 cl8 hov-cl1 trans-04"> 주방 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a>
        </c:when>
        <c:when test="${product.product_major_category eq 'bathroom'}">
          <a href="${MaruContextPath}/product/list" class="stext-109 cl8 hov-cl1 trans-04"> 욕실 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a>
        </c:when>
        <c:otherwise>
          <a href="${MaruContextPath}/product/list" class="stext-109 cl8 hov-cl1 trans-04"> 기타 <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i></a>
        </c:otherwise>
      </c:choose>
      <span class="stext-109 cl4"> ${product.product_name} </span>
    </div>
  </div>

  <!-- 상품 상세 -->
  <section class="sec-product-detail bg0 p-t-65 p-b-60">
    <div class="container">

      <div class="row">
        <div class="col-md-6 col-lg-7 p-b-30">
          <div class="p-l-25 p-r-30 p-lr-0-lg">
            <div class=" flex-sb flex-w">


              <div class=" gallery-lb">
                <div class="" data-thumb="${MaruContextPath}/resources/upload/s_${product.file_original}">
                  <div class=" pos-relative">

                    <c:choose>
                      <c:when test="${not empty product.file_original}">
                        <img src="${MaruContextPath}/resources/upload/s_${product.file_original}" alt="IMG-PRODUCT" width="500">
                        <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${MaruContextPath}/resources/upload/s_${product.file_original}"> <i class="fa fa-expand"></i>
                        </a>
                      </c:when>
                      <c:otherwise>
                        <img src="http://www.jagagu.net/app/dubu_board/docs/imgs/a/a14647698154525_Untitled-1.jpg" alt="IMG-PRODUCT" width="500">
                        <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${MaruContextPath}/resources/upload/s_${product.file_original}"> <i class="fa fa-expand"></i>
                        </a>
                      </c:otherwise>
                    </c:choose>



                  </div>
                </div>

                <%--                 <div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg"> --%>
                <!--                   <div class="wrap-pic-w pos-relative"> -->
                <%--                     <img src="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg" alt="IMG-PRODUCT"> <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/images/product-detail-02.jpg"> <i class="fa fa-expand"></i> --%>
                <!--                     </a> -->
                <!--                   </div> -->
                <!--                 </div> -->

                <%--                 <div class="item-slick3" data-thumb="${pageContext.request.contextPath}/resources/images/product-detail-03.jpg"> --%>
                <!--                   <div class="wrap-pic-w pos-relative"> -->
                <%--                     <img src="${pageContext.request.contextPath}/resources/images/product-detail-03.jpg" alt="IMG-PRODUCT"> <a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="${pageContext.request.contextPath}/resources/images/product-detail-03.jpg"> <i class="fa fa-expand"></i> --%>
                <!--                     </a> -->
                <!--                   </div> -->
                <!--                 </div> -->


              </div>
            </div>
          </div>
        </div>

        <div class="col-md-6 col-lg-5 p-b-30">
          <div class="p-r-50 p-t-5 p-lr-0-lg">
            <h2 class="mtext-105 cl2 js-name-detail p-b-14">${product.product_name}</h2>
            <!-- 할인 여부가 Y이고 할인율이 0보다 클 경우, 원래 가격에 작대기를 긋고 할인 가격을 표시 -->
            <c:choose>
              <c:when test="${product.product_sale eq 'Y' and product.product_sale_percent gt 0 }">
                <del>
                  <fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" />
                </del>
                <fmt:formatNumber value="${product.product_sale_percent/100 }" type="percent" />
                <h4 class="mtext-106 cl2">
                  <fmt:formatNumber value="${product.product_price - product.product_price * product.product_sale_percent/100}" type="currency" currencySymbol="₩" />
                </h4>
                <c:set var="SaledPrice" value="${product.product_price - product.product_price * product.product_sale_percent/100}" scope="request" />
              </c:when>
              <c:otherwise>
                <!-- 할인을 안 할 경우 정상가격 표시 -->
                <h4 class="mtext-106 cl2">
                  <fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" />
                </h4>
                <c:set var="SaledPrice" value="${product.product_price}" scope="request" />
              </c:otherwise>
            </c:choose>

            <p class="txt-right">
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
            </p>

            <p class="stext-102 cl3 p-t-23">규격 : ${product.product_size}</p>
            <p class="stext-102 cl3 p-t-23">
              제주/도서산간 제외 <strong>전국 배송 가능</strong><br>수도권 <strong>무료배송</strong>/그 외 지역 유료배송(하단 배송기준 참고)
            </p>
            <!--  -->
            <div class="p-t-33">

              <div class="flex-w p-b-10">
                <form action="${MaruContextPath}/order/order" method="post">
                  <div class="size-204 flex-w flex-m respon6-next">

                    <div class="wrap-num-product flex-w m-l-15 m-tb-10">
                      <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
                        <i class="fs-16 zmdi zmdi-minus"></i>
                      </div>

                      <input class="mtext-104 cl3 txt-center num-product" id="cart_product_number" type="number" name="cart_product_number" value="1">

                      <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                        <i class="fs-16 zmdi zmdi-plus"></i>
                      </div>
                    </div>
                    <span class="total_price_print m-lr-auto"> <fmt:formatNumber value="${SaledPrice}" type="currency" currencySymbol="₩" />
                    </span>
                    <input type="hidden" name="order_total_price" value="${SaledPrice}">
                    <div class="btn-group" role="group">
                      <a href="#" onClick="fn_addCart('${product.product_idx}')" class="flex-c-m stext-101 cl0 size-107 bg1 hov-btn1 m-lr-15 trans-04 js-addcart-detail">장바구니</a>
                      <input type="hidden" name="product_idx_list" value="${product.product_idx }" />
                      <button class="flex-c-m stext-101 cl0 size-107 bg1  hov-btn1 m-lr-15 trans-04 buy_button">즉시구매</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>

            <!--  -->

          </div>
        </div>
      </div>

      <div class="bor10 m-t-50 p-t-43 p-b-40">
        <!-- Tab01 -->
        <div class="tab01">
          <!-- Nav tabs -->
          <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item p-b-10"><a class="nav-link active" data-toggle="tab" href="#description" role="tab">상세정보</a></li>
            <li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#reviews" role="tab">리뷰</a></li>
            <li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#productqna" role="tab">상품문의</a></li>
            <li class="nav-item p-b-10"><a class="nav-link" data-toggle="tab" href="#information" role="tab">배송/교환/반품 안내</a></li>
          </ul>

          <!-- Tab panes -->
          <div class="tab-content p-t-43">
            <!-- - -->
            <div class="tab-pane fade show active" id="description" role="tabpanel">
              <div class="how-pos2 p-lr-15-md">
                <p class="stext-102 cl6">상세설명을 적어주세요. &#36;{product.product_detail} ${product.product_detail}</p>
              </div>
            </div>

            <!-- - -->
            <div class="tab-pane fade" id="information" role="tabpanel">
              <div class="row">
                <div class="col-sm-10 col-md-10 col-lg-8 m-lr-auto">
                  <table class="table table-bordered table-sm align-middle delivery m-b-50">
                    <tr>
                      <th rowspan="3" class="align-middle bg2 text-center">수도권</th>
                      <th class="bg6 text-center">서울</th>
                      <td>무료배송, 전지역 (1~2일 이내 도착)</td>
                    </tr>
                    <tr>
                      <th class="bg6 text-center">인천</th>
                      <td>무료배송, 전지역 (1~2일 이내 도착) (배송불가 도서지역 제외)</td>
                    </tr>
                    <tr>
                      <th class="bg6 text-center">경기</th>
                      <td>무료배송, 전지역 (1~2일 이내 도착)</td>
                    </tr>
                    <tr>
                      <th colspan="2" class="bg2 text-center">지방</th>
                      <td>유료배송(5,000원), 전지역 (2~3일 이내 도착)</td>
                    </tr>
                    <tr>
                      <th colspan="2" class="align-middle bg2 text-center">배송불가지역</th>
                      <td>
                        <p>제주도, 제부도, 대부도, 울릉도 등 섬지역 및 도서산간 지역</p>
                        <p>인천: 강화군, 영종도 일부지역, 옹진군</p>
                        <p>전라: 완도 일부지역, 진도 일부지역, 신안 일부지역</p>
                      </td>
                    </tr>
                  </table>

                  <table class="table table-bordered table-sm align-middle refund">
                    <tr>
                      <th class="align-middle bg2 text-center">교환/반품 비용</th>
                      <td>
                        <p>마루 멤버쉽 회원: 무료로 반품, 교환 가능</p>
                        <p>
                          마루 멤버쉽 회원 아닌 경우: <br />1) [총 주문금액] - [반품 상품금액] = 20,000원 미만인 경우 반품비 5,000원 <br>1) [총 주문금액] - [반품 상품금액] = 20,000원 이상인 경우 반품비 3,000원
                        </p>
                      </td>
                    </tr>
                    <tr>
                      <th class="align-middle bg2 text-center">교환/반품 신청 기준일</th>
                      <td>
                        <p>단숨변심에 의한 교환 반품은 제품 수령 후 2주일 이내</p>
                        <p>상품의 내용이 표시, 광고의 내용과 다른 경우에는 상품을 수령한 날 부터 1개월 이내에 청약철회 가능</p>
                      </td>
                    </tr>
                  </table>

                </div>
              </div>
            </div>

            <!-- - -->
            <div class="tab-pane fade" id="reviews" role="tabpanel">
              <div class="row">
                <div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
                  <div class="p-b-30 m-lr-15-sm">
                    <!-- Review -->
                    <c:if test="${empty reviewList  }">
                      <div class="p-b-68 txt-center">아직 작성된 리뷰가 없습니다.</div>
                    </c:if>
                    <c:forEach var="review" items="${reviewList}" varStatus="status">
                      <div class="flex-w flex-t p-b-68">


                        <div class="size-290">
                          <div class="flex-w flex-sb-m p-b-17">

                            <span class="mtext-107 cl2 p-r-20"> ${review.member_name } </span> <span class="fs-18 cl11"> <c:set var="emptyStar" value="5" /> <c:forEach var="i" begin="1" end="${review.star }" step="1">
                                <i class="zmdi zmdi-star"></i>
                                <c:set var="emptyStar" value="${emptyStar -1 }" />
                              </c:forEach> <c:if test="${emptyStar ge 1 }">
                                <c:forEach var="i" begin="1" end="${emptyStar }">
                                  <i class="zmdi zmdi-star-outline"></i>
                                </c:forEach>
                              </c:if>
                            </span>
                          </div>

                          <p class="stext-102 cl6">${review.content }</p>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>

            <!--  -->
            <div class="tab-pane fade" id="productqna" role="tabpanel">
              <div class="how-pos2 p-lr-15-md">

                <div class="container w-full m-tb-40">
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-lg bg7 cl7  m-all-20" data-toggle="modal" data-target="#product_qna_write">문의하기</button>

                  <!-- Modal -->
                  <div class="modal fade" id="product_qna_write" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <form action="" method="post">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">문의 작성하기</h5>
                            <a type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span>
                            </a>
                          </div>
                          <div class="modal-body">
                            <textarea class="form-control" name="content" id="content" cols="30" rows="10"></textarea>
                          </div>
                          <div class="modal-footer">
                            <input type="hidden" value="${product.product_idx }" />
                            <input type="hidden" value="${sessionScope.member_idx }" />
                            <a type="button" class="btn bg6 btn-outline-secondary" data-dismiss="modal">취소</a>
                            <input type="button" class="btn bg7 cl7 btn-outline-dark" value="등록" onclick="writeQuestion()">

                            <!-- 등록버튼 누르면 문의 등록시키고 ajax로 새로 목록 불러올 것 -->
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>

                  <table class="table table-striped table-hover">
                    <thead>
                      <tr>
                        <th class="text-center cl3 col-9">내용</th>
                        <th class="text-center cl3 col-3">날짜</th>
                      </tr>
                    </thead>
                    <tbody class="qna_parent">
                      <tr>
                        <td colspan="2" class="txt-center">작성된 문의가 없습니다.</td>
                      </tr>

                      <!-- 화면 테스트용 더미 -->
                      <!-- Ajax로 출력할 로직
                    1. 먼저 question list를 불러와서 출력
                    2. answer list를 불러옴
                    3. answer item의 parent_idx를 조회해서 answeritem.parent_idx = question.idx 이면 .question.idx의 동생자리에 출력
                    
                     -->
                  </table>
                </div>
              </div>
            </div>
            <!-- 문의 탭 끝 -->
          </div>
          <!-- 탭 목록 끝 -->
        </div>
        <!-- 전체 탭 끝 -->

      </div>
    </div>
    <!-- 제품 상세 컨테이너 -->
  </section>

  <script>
      /** 장바구니 CRUD 기능을 및 ajax로 구현하는 게 목표 
      
      로그인 여부 -> 세션값을 가져와서 체크
        
      1) 장바구니 추가 
        1. 로그인 됨, 비로그인 유저용 쿠키값 없음 
          -> 세션에서 member_idx를 받아와 cartVo로 담아 전송
        2. 로그인 됨, 비로그인 유저용 쿠키값 존재
          -> db에 비로그인 유저용 장바구니 member_idx를 회원member_idx로 변경후 장바구니 추가 로직 진행
        3. 비로그인, 쿠키값 없음 
          -> 새로 난수와 쿠키를 생성하여 장바구니 추가
        4. 비로그인, 쿠키값 존재
          -> 
      
      1)-2 로그인 유저는 즉시 구매 버튼을 이용해 구매페이지로 이동 가능. 
           비로그인일 경우 회원만 가능합니다. 로그인 하시겠습니까 confirm 창 띄우기 
        
      2) 장바구니 추가 성공시 -> 장바구니로 이동, 계속 쇼핑하기 modal창 출력.
      
      
      번외
      회원가입시 -> 장바구니 쿠키를 가지고 있을경우 해당 정보를 새로운 member_idx에 귀속된 회원용 장바구니로 이동
        
       */
      function fn_addCart(idx) { //idx 값에는 product_idx가 담김. 장바구니 버튼 위치 line 096

        let cart_product_number = document.getElementById("cart_product_number").value; // 담을 물건 숫자

        $.ajax({
          type : "post",
          url : "${MaruContextPath}/cart/add_process?product_idx=" + idx + "&cart_product_number=" + cart_product_number,
          data : {
            "product_idx" : idx,
            "cart_product_number" : cart_product_number
          },
          success : addCartSuccess,
          error : addCartFail,
        })
      }

      function addCartSuccess() { //장바구니로 이동 혹은 계속 쇼핑하기 여부 modal 창으로 출력
        console.log("성공");

      }

      function addCartFail() {
        alert("오류가 발생했습니다. 다시 시도해주세요.");
      }
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      let SaledPrice = "${SaledPrice}";
      $("body").on("click keyup", function() {
        //console.log("클릭, 키업");
        let cart_product_number = $("#cart_product_number").val();
        let total_price = SaledPrice * cart_product_number;
        $("input[name=order_total_price]").val(SaledPrice * cart_product_number);
        $("span.total_price_print").html("₩" + total_price.toLocaleString("en").split(".")[0]);
      });
    </script>
  <script>
      let product_idx = "${product.product_idx}";
      let session_member_idx = "${sessionScope.member_idx}";
      let session_member_admin = "${sessionScope.member_admin}";
      function getQuestionList() {
        $.ajax({
          type : "GET",
          url : "qna/list?product_idx=" + product_idx,
          data : product_idx,
          dataType : "JSON",
          success : function(result) {
            console.log(result);
            if (result.length > 0) { // 서버에서 받아온 결과의 길이가 0보다 크면 기본메세지를 삭제
              $("tbody.qna_parent").empty();
              console.log("문의 목록 초기화");
            }
            $(result).each(function(index, item) {
              let qna_section = "";
              let wdate_unix = item.wdate;

              //reply_date += 32400; // 유닉스 시간으로 받아올경우 세계표준시므로 한국시간을 표현하려면 9시간 32400초를 더함
              let wdate = new Date(wdate_unix).toISOString().slice(0, 19).replace("T", " ");

              qna_section += '<tr class="qna_question question';
              qna_section += item.idx;
              qna_section += '"><td class=""><a class="cl6" href="#" data-toggle="collapse" data-target="#parent';
              qna_section += item.idx;
              qna_section += '" aria-expanded="true" aria-controls="answer_content">';
              qna_section += item.content;
              qna_section += '</a></td><td class="text-center cl3">';
              qna_section += wdate;
              if (session_member_admin == "Y") {
                /** 관리자인 경우엔 삭제버튼만 출력 */
                qna_section += '<span class="pull-right"><a href="javascript:void(0)" onclick="removeQna(this)">삭제</a><input type="hidden" value="';
                qna_section += item.idx;
                qna_section += '"></span>';
              }
              qna_section += "</td></tr>";

              if (session_member_idx == item.member_idx) {
                /** 멤버 idx가 일치할 시에만 수정, 삭제 버튼 출력*/
                /** 이 위로 member_idx 일치 유저만 출력*/
              }

              qna_section += "";

              $("tbody.qna_parent").append(qna_section);

            });

            getAnswerList();
          },
          error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
          },
        });
      }
      function getAnswerList() {
        $.ajax({
          type : "GET",
          url : "qna/listAnswer?product_idx=" + product_idx,
          data : product_idx,
          dataType : "JSON",
          success : function(result) {

            $(result).each(function(index, item) {
              let qna_section = "";
              let wdate_unix = item.wdate;

              let wdate = new Date(wdate_unix).toISOString().slice(0, 19).replace("T", " ");

              qna_section += '<tr class="qna_answer"><td class="">';
              qna_section += '<div id="parent';
              qna_section += item.parent_idx;
              qna_section += '" class="collapse show">';
              qna_section += "ㄴ 답변 : ";
              qna_section += item.content;
              qna_section += "</div></td>";
              qna_section += '<td class="text-center cl3">';
              qna_section += '<div id="parent';
              qna_section += item.parent_idx;
              qna_section += '" class="collapse show">';
              qna_section += wdate;
              if (session_member_admin == "Y") {
                /** 관리자인 경우엔 삭제버튼만 출력 */
                qna_section += '<span class="pull-right"><a href="javascript:void(0)" onclick="removeQna(this)">삭제</a><input type="hidden" value="';
                qna_section += item.idx;
                qna_section += '"></span>';
              }
              qna_section += "</div>";
              qna_section += "</td>";
              qna_section += "</tr>";

              if (session_member_idx == item.member_idx) {
                /** 멤버 idx가 일치할 시에만 수정, 삭제 버튼 출력*/
                /** 이 위로 member_idx 일치 유저만 출력*/
              } else if (session_member_admin == "Y") {
                /** 관리자인 경우엔 삭제버튼만 출력 */
              }
              qna_section += "";
              let parent_class_name = "tr.question" + item.parent_idx;

              $("tr.question" + item.parent_idx).after(qna_section);
            });
          },
          error : function(request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
          },
        });
      }
      getQuestionList();

      function writeQuestion() {
        console.log("prevevnt");
        event.preventDefault();
        console.log("123");
        if ($("input#reply_content").val() !== "") {
          $.ajax({
            type : "post",
            url : "qna/write?product_idx=" + product_idx,
            data : {
              product_idx : product_idx,
              content : $("textarea#content").val(),
            },
            success : function(result) {
              console.log("작성 성공");
              $("textarea#content").val("");
              $(".modal").modal("hide");
              getQuestionList();
            },
            error : function(request, status, error) {
              alert("status:" + status + "\n\n" + "code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
              console.log(status);
              console.log(request);
              console.log(error);
            },
          });
        }
      }
      function removeQna(obj) {
        console.log(obj);
        let idx = $(obj).next().val();
        console.log(idx);
        //let member_idx = $(obj).parent().next().next().val();

        $.ajax({
          type : "post",
          url : "qna/remove?idx=" + idx,
          data : {
          //member_idx : member_idx,
          },
          success : function(result) {
            console.log(result);
            console.log("삭제 성공");
            getQuestionList();
          },
          error : function(request, status, error) {
            alert("status:" + status + "\n\n" + "code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
            console.log(status);
            console.log(request);
            console.log(error);
          },
        });
      }
    </script>

</body>
</html>