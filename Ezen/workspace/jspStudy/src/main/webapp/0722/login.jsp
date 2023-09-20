<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <form action="login_pro.jsp" method="post">
    <p>
      id : <input type="text" name="id" />
    </p>
    <p>
      pw : <input type="password" name="pw" />
    </p>
    <input type="submit" value="로그인" />
    <hr />
    사용자가 입력한 값이 id:tester1, password:1234 또는 <br /> id:tester2,
    pw:5678인 경우 로그인 처리<br />아닌 경우 다시 login.jsp 페이지로 이동
  </form>
</body>
</html>