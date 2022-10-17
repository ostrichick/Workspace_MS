<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자주묻는 질문(FAQ)</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<style>
.pagination {
  justify-content: center;
}

#button {
  color: #fff;
  background-color: #6c757d;
  border-color: #6c757d;
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

#serch {
  float: left;
  width: 70%;
  height: 140px;
}

#bt {
  float: right;
}

tr {
  vertical-align: middle;
  text-align: center;
}
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  <div class="container" style="margin: 40px auto;">
    <table class="table table-striped table-hover">
      <thead>
        <tr>
          <th>
            <h3>자주묻는 질문(FAQ)</h3>
            <div class="bor10 m-t-20" id="serch">
              <p class="m-t-20 m-b-10" style="text-align: center;">검색을 이용하시면 보다 빠르게 원하시는 답변을 얻으실 수 있습니다.</p>
              <h4 class="m-l-40 m-t-5 m-r-50" style="float: left;">FAQ 검색</h4>
              <div class="input-group" style="width: 460px;">
                <input type="text" class="form-control" placeholder="검색어를 입력하세요" aria-label="검색어를 입력하세요" aria-describedby="button-addon2">
                <button id="button" style="width: 80px;" class="btn btn-outline-secondary" type="button" id="button-addon2">검색</button>
              </div>
            </div>
            <div class="bor10 m-t-20 m-b-20" style="float: right; width: 30%; height: 140px; text-align: center;">
              <p>원하시는 정보를 얻지 못하셨나요?</p>
              <a href="#" onclick="faq_qna()" class="btn btn-success m-t-10" id="button">문의하기</a>
            </div>
            <h4 class="m-t-130 m-b-20">FAQ &gt; 전체</h4>
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <c:if test="${member_admin eq 'Y' }">
            <th>선택</th>
          </c:if>
          <th>카테고리</th>
          <th>제목</th>
          <th>조회수</th>
        </tr>
      </tbody>
      <tbody>
        <c:forEach var="faq" items="${noticeList}" varStatus="status">
          <tr>
            <c:if test="${member_admin eq 'Y' }">
              <td class="text-right">
                <input type="checkbox" value="선택" name="celect">
              </td>
            </c:if>
            <td class="text-right">
              <select>
                <option>거실</option>
                <option>침실</option>
                <option>드레스룸</option>
                <option>서재</option>
                <option>주방</option>
                <option>욕실</option>
              </select>
            </td>
            <td class="text-center">
              <a href='#' onClick='fn_view(${faq.idx})'>${faq.title}</a>
            </td>
            <td class="text-right">${faq.hit}</td>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    <div id="bt">
      <c:if test="${member_admin eq 'Y' }">
        <a href="#" onclick="fq_delet()" class="btn btn-delet" id="button">삭제</a>
        <a href="${MaruContextPath}/faq/write" onclick="write()" class="btn btn-success" id="button">등록</a>
      </c:if>
    </div>
    <nav aria-label="Page navigation example">
      <ul class="pagination">
        <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
        <li class="page-item active"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">다음</a></li>
      </ul>
    </nav>
  </div>
  <script>
  /*1대1문의페이지이동*/ 
  function faq_qna() { 
//     e.preventDefault();
    location.href = "${MaruContextPath}/qna/list";  
  }
  
/**글쓰기*/
   function write() {  
       location.href = "${MaruContextPath}/faq/write"; 
    }
      
</script>
  <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
</body>
</html>