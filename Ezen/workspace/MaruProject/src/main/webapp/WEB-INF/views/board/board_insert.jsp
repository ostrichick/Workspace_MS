<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글입력</title>
</head>
<body>

  <h3>게시글 입력</h3>
  <form action="${pageContext.request.contextPath}/board/board_insert.do" method="post" enctype="multipart/form-data">
    <input type="hidden" name="member_idx" value="${member_idx}" />
    <!-- 게시글에 포함할 내용
작성자, 제목, 내용, 주소, 가격, 파일
 -->
    작성자:
    <input type="text" name="writer" />
    <p>
      제목:
      <input type="text" name="title" />
    <p>
      내용:
      <textarea name="content" cols="10" rows="5"></textarea>
    <p>
      주소:
      <input type="text" name="address" />
    <p>
      가격:
      <input type="text" name="price" />
    <p>

      최대 3개까지 파일 업로드<br>
      <input type="file" name="uploadFile" multiple />
      <input type="submit" value="전송" />
      <input type="reset" value="취소" />
  </form>


</body>
</html>