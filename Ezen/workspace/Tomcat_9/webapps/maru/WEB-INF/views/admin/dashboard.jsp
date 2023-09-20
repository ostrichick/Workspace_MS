<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>관리자 메인</title>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<style>
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

    <h2 class="m-tb-50">관리자 페이지</h2>

    <!-- 회원 요약 -->
    <div class="container w-full txt-center bg6 p-all-30 m-b-50">
      <a href="${pageContext.request.contextPath}/admin/memberList" class="btn bg7 cl7 btn-outline-secondary pull-left m-l--30 m-t--30 m-b-30">회원관리</a>
      <table class="table table-bordered table-hover table-stripped">
        <thead>
          <tr class="bg1 txt-center">
            <th>선택</th>
            <th>아이디</th>
            <th>이름</th>
            <th>전화번호</th>
            <th class="col-lg-3 col-md-4 col-sm-4 col-xs-4">주소</th>
            <th class="col-lg-3 col-md-4 col-sm-4 col-xs-4">상세주소</th>
            <th>가입일</th>
            <th>탈퇴여부</th>
          </tr>
        </thead>
        <c:forEach var="member" items="${memberList}" varStatus="status">
          <tr class="bg0">
            <td>
              <input type="checkbox" value="선택" />
            </td>
            <td>${member.member_id }</td>
            <td>${member.member_name}</td>
            <td>${member.member_phone}</td>
            <td>${member.member_addr}</td>
            <td>${member.member_addr2}</td>
            <td>
              <fmt:formatDate pattern="yyyy.MM.dd" value="${member.member_date}" />
            </td>
            <td>${member.deleted_yn}</td>
          </tr>
        </c:forEach>
      </table>
      <p>
        전체 회원 <strong> ${stats.memberInfoCount }</strong>명 중 최근
        <c:choose>
          <c:when test="${stats.memberInfoCount gt 10 }">10</c:when>
          <c:otherwise>${stats.memberInfoCount}</c:otherwise>
        </c:choose>
        명 출력
      </p>
    </div>

    <!-- 상품 요약 -->
    <div class="container w-full txt-center bg6 p-all-30 m-b-50">
      <a href="${pageContext.request.contextPath}/admin/updateList" class="btn bg7 cl7 btn-outline-secondary pull-left m-l--30 m-t--30 m-b-30">상품 목록</a>
      <table class="table table-bordered table-hover table-stripped">
        <thead>
          <tr class="bg1">
            <th>상품명</th>
            <th class="col-2">가격</th>
            <th class="col-1">할인여부</th>
            <th class="col-1">할인율 %</th>
            <th class="col-2">할인된 가격</th>
            <th class="col-1">재고</th>
            <th class="col-1">상품삭제</th>
          </tr>
        </thead>
        <c:forEach var="product" items="${productList}" varStatus="status">
          <tr class="bg0">
            <td>
              <a href="${MaruContextPath}/product/detail?product_idx=${product.product_idx}" class="">${product.product_name}</a>
            </td>
            <td>
              <fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" />
            </td>
            <td>${product.product_sale}</td>
            <td>${product.product_sale_percent}%</td>
            <td>
              <c:choose>
                <c:when test="${product.product_sale eq 'Y' }">
                  <fmt:formatNumber value="${product.product_price - product.product_price * product.product_sale_percent/100}" type="currency" currencySymbol="₩" />
                </c:when>
                <c:otherwise>
                  <fmt:formatNumber value="${product.product_price }" type="currency" currencySymbol="₩" />
                </c:otherwise>
              </c:choose>
            </td>
            <td>${product.product_inventory}</td>
            <td>
              <a class="btn bg7 cl7 btn-outline-secondary m-all--10" href="${MaruContextPath}/product/delete_process?product_idx=${product.product_idx}">삭제</a>
            </td>
          </tr>
        </c:forEach>

      </table>
      <p>
        전체 상품 <strong> ${stats.productCount }</strong>개 중 최근
        <c:choose>
          <c:when test="${stats.productCount gt 10 }">10</c:when>
          <c:otherwise>${stats.productCount}</c:otherwise>
        </c:choose>
        개 출력
      </p>
    </div>

    <!-- 상품 문의 요약 -->
    <div class="container w-full txt-center bg6 p-all-30 m-b-50">
      <a href="${pageContext.request.contextPath}/admin/" class="btn bg7 cl7 btn-outline-secondary pull-left m-l--30 m-t--30 m-b-30">상품 문의</a>
      <table class="table table-bordered table-hover table-stripped">
        <thead>
          <tr class="bg1">
            <th>상품</th>
            <th class="col-6">문의내용</th>
            <th>아이디</th>
            <th>작성일</th>
            <th>답변여부</th>
          </tr>
        </thead>
        <c:forEach var="qna" items="${qnaList}" varStatus="status">
          <tr class="bg0">
            <td>
              <a href="${MaruContextPath}/product/detail?product_idx=${qna.product_idx}">${qna.product_name }</a>
            </td>
            <td>${qna.content}</td>
            <td>${qna.member_id}</td>
            <td>${qna.wdate }</td>
            <td>
              <c:choose>
                <c:when test="${qna.isAnswered eq 'N'}">
                  <%--                   <input class="btn btn-outline-dark bg7 cl7" type="button" value="답변작성" onclick="answerQna('${qna.idx}')" /> --%>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn bg7 cl7" data-toggle="modal" data-target="#idx${qna.idx }">답변작성</button>
                  <!-- Modal -->
                  <div class="modal fade" id="idx${qna.idx }" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                      <div class="modal-content">
                        <form action="" method="post">
                          <div class="modal-header">
                            <h5 class="modal-title">답변 작성하기</h5>
                            <a type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span>
                            </a>
                          </div>
                          <div class="modal-body">
                            <textarea class="form-control idx${qna.idx }" name="content" id="content" cols="30" rows="10"></textarea>
                          </div>
                          <div class="modal-footer">
                            <input type="hidden" name="parent_idx" value="${qna.idx }" />
                            <input type="hidden" name="parent_idx" value="${qna.product_idx }" />
                            <a type="button" class="btn bg6 btn-outline-secondary" data-dismiss="modal">취소</a>
                            <input type="button" class="btn bg7 cl7 btn-outline-dark" value="등록" onclick="writeAnswer('${qna.idx}','${qna.product_idx }', this)">
                          </div>
                        </form>
                      </div>
                    </div>
                  </div>

                </c:when>
                <c:otherwise>답변완료</c:otherwise>
              </c:choose>
            </td>
          </tr>
        </c:forEach>
      </table>
      <p>
        전체 문의 <strong> ${stats.allQuestionCount }</strong>개 중 총 <strong>${stats.unansweredQuestionCount }</strong> 개의 답변 안 된 문의 출력
      </p>
    </div>
  </section>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <!-- script -->
  <script>
      let getStats = "${getStats}";

      let stats = '${stats}';
      stats = JSON.parse(stats);

      let data = undefined;
      function updateStats() {
        $.ajax({
          type : "GET",
          url : "getStats",
          dataType : "JSON",
          success : function(result) {
            data = result;
            console.log(data);
          },
          error : function(request, status, error) {
            alert("status:" + status + "\n\n" + "code:" + request.status + "\n\n" + "message:" + request.responseText + "\n\n" + "error:" + error);
            console.log(status);
            console.log(request);
            console.log(error);
          },
        });
      }
      updateStats();

      function writeAnswer(parent_idx, product_idx, obj) {
        console.log(obj);
        event.preventDefault();

        let content = $("textarea.idx" + parent_idx).val();
        console.log(content);
        if ($("input#reply_content").val() !== "") {
          $.ajax({
            type : "post",
            url : "../product/qna/writeAnswer?product_idx=" + product_idx,
            data : {
              product_idx : product_idx,
              parent_idx : parent_idx,
              content : $("textarea#content.idx" + parent_idx).val(),
            },
            success : function(result) {
              console.log(result);
              console.log("작성 성공");
              $("textarea").val("");
              $(".modal").modal("hide");
              console.log($(obj).parent().parent().parent().parent().parent().parent());
              $(obj).parent().parent().parent().parent().parent().parent().find("button").remove();
              $(obj).parent().parent().parent().parent().parent().parent().prepend("답변완료");
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
    </script>
</body>
</html>