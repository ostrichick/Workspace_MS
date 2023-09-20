<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/header.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/footer.css" />
<style>
section {
  height: 500px;
  box-sizing: border-box;
  margin: auto;
}

form {
  width: 55%;
  height: 100%;
  margin: auto;
}

input {
  height: 30px;
  width: 267px;
}

input[type="submit"] {
  width: 277px;
  height: 40px;
  padding: 0px;
  height: 40px;
}
</style>
</head>
<body>
  <%@include file="/include/header.jsp"%>
  <section>
    <form action="join_action.jsp" method="post">
      <fieldset>
        <legend>회원가입</legend>
        <p>
          <label>id <br /> <input type="text" name="id" required/></label>
        </p>
        <p>
          <label>password <br /> <input type="password" name="password" required/></label>
        </p>
        <p>
          <label>name <br /> <input type="text" name="name" required/></label>
        </p>
        <p>
          <label>addr <br /> <input type="text" name="addr" /></label>
        </p>
        <p>
          <input type="submit" value="회원가입" />
        </p>
      </fieldset>
    </form>
  </section>
  <%@include file="/include/footer.jsp"%>
</body>
</html>