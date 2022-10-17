<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="MaruContextPath" value="${pageContext.request.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
<title>내 정보</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<style>
.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 1.5rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}

.star-rating input {
  display: none;
}

.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}

.star-rating :checked ~ label {
  -webkit-text-fill-color: red;
}

.star-rating label:hover, .star-rating label:hover ~ label {
  -webkit-text-fill-color: red;
}

.pagination {
  justify-content: center;
}

a.page-link {
  color: #666;
}

li.page-item.active>a.page-link {
  background: #666;
  color: #eee;
  border-color: #333;
}

li.page-item.active>a.page-link:hover {
  background: #444;
}
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <section class="container m-t-50">

    <h2 class="m-tb-50">마이페이지</h2>

    <!-- 주문 목록 -->
    <div class="container w-full txt-center bg6 p-all-30 m-b-50">
      <a href="${MaruContextPath}/myinfo/orderList" class="btn bg7 cl7 btn-outline-secondary pull-left m-l--30 m-t--30 m-b-30">주문 내역</a>
      <table class="table table-bordered table-hover table-stripped">
        <thead>
          <tr class="bg1 txt-center">
            <th></th>
            <th>주문일자</th>
            <th>결제금액</th>
            <th>품목</th>

            <th>진행상황</th>
            <th>별점</th>
            <th>리뷰</th>
          </tr>
        </thead>
        <c:forEach var="order" items="${orderList}" varStatus="status">
          <tr class="bg0">
            <td>
              <a href="${MaruContextPath}/myinfo/orderList?order_idx='${order.order_idx }'">상세보기</a>
            </td>
            <td>
              <fmt:formatDate pattern="yyyy.MM.dd" value="${order.order_date}" />
            </td>
            <td>${order.order_total_price}</td>
            <td>
              <a href="${MaruContextPath}/myinfo/orderList?order_idx='${order.order_idx }'">대표상품명 + 외 x개</a>
            </td>
            <td>${order.order_status}</td>
            <td></td>
            <td></td>
          </tr>
        </c:forEach>
      </table>
      <p>
        전체 주문 <strong> ${stats.orderCount }</strong>개 중 최근
        <c:choose>
          <c:when test="${stats.orderCount gt 10 }">10</c:when>
          <c:otherwise>${stats.orderCount}</c:otherwise>
        </c:choose>
        개 출력
      </p>
    </div>

    <!-- 리뷰 목록 -->
    <div class="container w-full txt-center bg6 p-all-30 m-b-50">
      <a href="${MaruContextPath}/myinfo/reviewList" class="btn bg7 cl7 btn-outline-secondary pull-left m-l--30 m-t--30 m-b-30">리뷰 내역</a>
      <table class="table table-bordered table-hover table-stripped">
        <thead>
          <tr class="bg1 txt-center">
            <th>상품명</th>
            <th>내용</th>
            <th>별점</th>
            <th>등록일</th>
          </tr>
        </thead>
        <c:forEach var="review" items="${reviewList}" varStatus="status">
          <tr class="bg0">
            <td>
              <a href="${MaruContextPath}/product/detail?product_idx='${review.product_idx }'">${review.product_name }</a>
            </td>
            <td>${review.content}</td>
            <td>
              <span class="fs-18 cl11"> <c:set var="emptyStar" value="5" /> <c:forEach var="i" begin="1" end="${review.star }" step="1">
                  <i class="zmdi zmdi-star"></i>
                  <c:set var="emptyStar" value="${emptyStar -1 }" />
                </c:forEach> <c:if test="${emptyStar ge 1 }">
                  <c:forEach var="i" begin="1" end="${emptyStar }">
                    <i class="zmdi zmdi-star-outline"></i>
                  </c:forEach>
                </c:if>
              </span>
            </td>
            <td>
              <fmt:formatDate pattern="yyyy.MM.dd" value="${review.wdate}" />
            </td>
          </tr>
        </c:forEach>
      </table>
      <p>
        전체 리뷰 <strong> ${stats.reviewCount }</strong>개 중 최근
        <c:choose>
          <c:when test="${stats.reviewCount gt 10 }">10</c:when>
          <c:otherwise>${stats.reviewCount}</c:otherwise>
        </c:choose>
        개 출력
      </p>
    </div>

    <!-- 문의 목록 -->
    <div class="container w-full txt-center bg6 p-all-30 m-b-50">
      <a href="${MaruContextPath}/myinfo/qnaList" class="btn bg7 cl7 btn-outline-secondary pull-left m-l--30 m-t--30 m-b-30">문의 내역</a>
      <table class="table table-bordered table-hover table-stripped">
        <thead>
          <tr class="bg1 txt-center">
            <th>상품명</th>
            <th>문의내용</th>
            <th>등록일</th>
            <th>답변내용</th>
            <th>답변일</th>
          </tr>
        </thead>
        <c:forEach var="qna" items="${qnaList}" varStatus="status">
          <tr class="bg0">
            <td>
              <a href="${MaruContextPath}/product/detail?product_idx=${qna.product_idx }"> ${qna.product_name }</a>
            </td>
            <td>${qna.content}</td>
            <td>
              <%--               <fmt:formatDate pattern="yyyy.MM.dd" value="${qna.wdate}" /> --%>
              ${qna.wdate }
            </td>
            <td>답변내용</td>
            <td>답변일</td>
          </tr>
        </c:forEach>
      </table>
      <p>
        전체 문의 <strong> ${stats.qnaCount }</strong>개 중 최근
        <c:choose>
          <c:when test="${stats.qnaCount gt 10 }">10</c:when>
          <c:otherwise>${stats.qnaCount}</c:otherwise>
        </c:choose>
        개 출력
      </p>
    </div>
  </section>



  <h3 class="ml-5" style="margin-top: 150px;">마이페이지</h3>
  <section class="">
    <hr>
    <div class="container">
      <h5 class="float-left ml-5">
        <strong>member_name 님 환영합니다</strong>
      </h5>
      <button type="button" class="btn bg-dark text-white float-right link_to_myinfo_edit" style="margin-right: 100px;">회원정보수정</button>
    </div>
    <hr style="clear: both; visibility: hidden; margin: 0;">
    <hr>
    <!-- 주문내역 목록 시작-->
    <div class="mt-5 container">
      <h5 class="ml-5">
        <strong>member_name 님의 주문내역 목록입니다</strong>
      </h5>
      <table class="table mt-5">
        <thead>
          <tr>
            <th></th>
            <th>주문일자</th>
            <th>결제금액</th>
            <th>품목</th>
            <th>진행상황</th>
            <th>별점</th>
            <th>리뷰</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>
              <a href="${MaruContextPath}/order/order_detail?order_idx=" id="order_detail">상세보기</a>
            </td>
            <td>2022.07.08</td>
            <td>180,000원</td>
            <td>
              <img src="${MaruContextPath}/resources/images/product-10.jpg" width="50px" height="50px" />&nbsp; 조이갈란드
            </td>
            <td>
              배송중 &nbsp;
              <button type="button" class="btn btn-outline-primary btn-sm">배송조회</button>
            </td>
            <td>
              <div class="star-rating space-x-4">
                <input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" />
                <label for="5-stars" class="star pr-4">★</label>
                <input type="radio" id="4-stars" name="rating" value="4" v-model="ratings" />
                <label for="4-stars" class="star">★</label>
                <input type="radio" id="3-stars" name="rating" value="3" v-model="ratings" />
                <label for="3-stars" class="star">★</label>
                <input type="radio" id="2-stars" name="rating" value="2" v-model="ratings" />
                <label for="2-stars" class="star">★</label>
                <input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
                <label for="1-star" class="star">★</label>
              </div>
            </td>
            <td>
              <button type="button" class="btn btn-outline-primary btn-sm">리뷰등록하기</button>
            </td>
          </tr>
        </tbody>
      </table>
      <!-- 페이지 네이게이션 만들기 -->
      <nav aria-label="Page navigation example" style="margin: 0 500px;">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
          </a></li>
          <li class="page-item active"><a class="page-link" href="#">1</a></li>
          <li class="page-item"><a class="page-link" href="#">2</a></li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item"><a class="page-link" href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span>
          </a></li>
        </ul>
      </nav>
    </div>
    <!-- 주문내역 목록 끝-->
    <hr style="margin: 50px 0;">

  </section>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script>
      document.querySelector(".link_to_myinfo_edit").addEventListener("click", function() {
        location.href = "${MaruContextPath}/member/myinfo_edit";
      })
    </script>
  <script type="text/javascript">
      
    </script>
</body>
</html>