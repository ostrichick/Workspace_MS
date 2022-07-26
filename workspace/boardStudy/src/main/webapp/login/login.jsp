<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
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
    <h2>로그인</h2>
    <form action="login_action.jsp" method="post">
    <fieldset>
    <legend>입력</legend>
      <p>
        <label for="">id : <input type="text" name="id" /></label>
      </p>
      <p>
        <label for="">password : <input type="password" name="password" /></label>
      </p>
      <p>
        <input type="submit" value="로그인" />
      </p>
      </fieldset>
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>