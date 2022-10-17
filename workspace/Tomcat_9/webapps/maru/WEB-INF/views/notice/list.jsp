<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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

  <div class="container w-full m-tb-40">
    <h2 class="m-tb-30">공지사항</h2>
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th class="text-center cl3 col-1">번호</th>
          <th class="text-center cl3 col-6">제목</th>
          <th class="text-center cl3 col-2">날짜</th>
          <th class="text-center cl3 col-1">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="notice" items="${noticeList}" varStatus="status">
          <tr>
            <td class="text-right cl3">${notice.idx}</td>
            <td class="">
              <a class="cl5" href='${MaruContextPath}/notice/view?idx=${notice.idx}'>${notice.title} <span>[${notice.reply_count}]</span></a>
            </td>
            <td class="text-center cl3">
              <fmt:formatDate pattern="yyyy.MM.dd HH:mm" value="${notice.wdate}" />
            </td>
            <td class="text-right cl3">${notice.hit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <c:if test="${member_admin eq 'Y' }">
      <a href='#' onClick='fn_write()' class="btn btn-secondary pull-right">글쓰기</a>
    </c:if>


    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <c:if test="${paging.startPage != 1 }">
          <li class="page-item"><a class="page-link" href="list?nowPage=${paging.startPage - 1 }&perPage=${paging.perPage}">이전</a></li>
        </c:if>
        <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
          <c:choose>
            <c:when test="${p == paging.nowPage }">
              <li class="page-item active"><a class="page-link" href="#">${p }</a></li>
            </c:when>
            <c:when test="${p != paging.nowPage }">
              <li class="page-item"><a class="page-link" href="list?nowPage=${p }&perPage=${paging.perPage}">${p }</a></li>
            </c:when>
          </c:choose>
        </c:forEach>
        <c:if test="${paging.endPage != paging.lastPage}">
          <li class="page-item"><a class="page-link" href="list?nowPage=${paging.endPage+1 }&perPage=${paging.perPage}">다음</a></li>
        </c:if>
      </ul>
    </nav>
  </div>
  <script>
      /**글쓰기*/
      function fn_write() {
        location.href = "${MaruContextPath}/notice/write";
      }
      /**글조회*/
      function fn_view(idx) {
        let url = "${MaruContextPath}/notice/view?idx=";
        url += idx;
        location.href = url;
      }
    </script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>