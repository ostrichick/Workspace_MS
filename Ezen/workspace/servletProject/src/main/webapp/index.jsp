<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
  <h3>환영합니다</h3>
  <a href="<%=request.getContextPath()%>/board/list.do">게시글 목록으로 이동</a>
  <!-- 서블릿으로 요청을 보내려면 클래스에 접근할 수 있는 가상경로를 사용해야함 -->

  <a href="<%=request.getContextPath()%>/member/list.do">회원 목록으로 이동</a>
  <!--  index.jsp에 회원목록 이동 링크 클릭시 FrontController 사용하여 list.jsp가 화면에 출력되도록 구현 -->
</body>
</html>