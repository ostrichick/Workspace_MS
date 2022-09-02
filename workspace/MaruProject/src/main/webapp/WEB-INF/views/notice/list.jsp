<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>공지사항</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />

</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <div class="container" style="margin: 30px auto;">
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>번호</th>
          <th>제목</th>
          <th>날짜</th>
          <th>조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach var="notice" items="${noticeList}" varStatus="status">
          <tr>
            <td>${notice.idx}</td>
            <td>
              <a href='#' onClick='fn_view(${notice.idx})'>${notice.title}</a>
            </td>
            <td>
              <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${notice.wdate}" />
            </td>
            <td>${notice.hit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div>
      <c:if test="${member_admin eq 'Y' }">
        <a href='#' onClick='fn_write()' class="btn btn-success">글쓰기</a>
      </c:if>
    </div>
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
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>