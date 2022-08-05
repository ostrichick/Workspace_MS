<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h2>로그인</h2>
  <form action="login_action.jsp" method="post">
    <p>
      id<br />
      <input type="text" name="id" />
    </p>
    <p>
      password<br />
      <input type="text" name="password" />
    </p>
    <input type="submit" value="접속" />
  </form>
</body>
</html>