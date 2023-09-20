<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <form action="write_action.jsp" method="post">
      <fieldset>
        <legend>글쓰기</legend>
        <p>
          글쓴이 :<input type="text" name="writer" />
        </p>
        <p>
          제목 :<input type="text" name="title" />
        </p>
        <p>
          내용 :
          <textarea name="content" id="" cols="30" rows="10"></textarea>
        </p>
        <input type="submit" value="전송"/>
      </fieldset>
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>