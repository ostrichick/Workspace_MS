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
    <div class="container my-1">
      <div class="row">
        <table class="table">
          <thead>
            <tr class="table-active">
              <th scope="col" style="width: 60%">${boardVo.title}<br>
              </th>
              <th scope="col" style="width: 40%" class="text-right">조회 : ${boardVo.hit} <br>${boardVo.wdate }</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <pre>${boardVo.content}</pre>
                <br>
                <c:if test="${not empty boardVo.file_original}">
                  <img src="${pageContext.request.contextPath}/resources/upload/s_${boardVo.file_original}" style="width: 300px; height: 200px;" />
                  <img src="${pageContext.request.contextPath}/resources/upload/${boardVo.file_original}" />
                  <img src="${pageContext.request.contextPath}/resources/upload/${boardVo.file_system}" />
                </c:if>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <button onClick='toList()' class="toList btn btn-secondary mb-3">목록으로</button>
    <c:if test="${member_admin eq 'Y' }">
      <button onClick='toEdit()' class="toEdit btn btn-secondary mb-3">수정</button>
      <button onClick='toDelete()' class="toDelete btn btn-secondary mb-3">삭제</button>
    </c:if>
  </div>
  <script>
      function toList() {
        location.href = "${MaruContextPath}/notice/list";
      }
      function toEdit() {
        let url = "${MaruContextPath}/notice/edit?idx=";
        let idx = "${boardVo.idx}"
        url += idx;

        console.log(idx);
        console.log(url);
        location.href = url;
      }
      function toDelete() {
        let url = "${MaruContextPath}/notice/delete?idx=";
        let idx = "${boardVo.idx}"
        url += idx;

        console.log(idx);
        console.log(url);
        location.href = url;
      }
    </script>

  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>