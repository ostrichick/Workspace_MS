<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h2>회원가입</h2>
  <form action="join_action.jsp" method="post">
    <p>
      id<br />
      <input type="text" name="id" />
    </p>
    <p>
      name<br />
      <input type="text" name="name" />
    </p>
    <p>
      password<br />
      <input type="text" name="password" />
    </p>
    <p>
      addr<br />
      <input type="text" name="addr" />
    </p>
    <input type="submit" />
  </form>
</body>
</html>