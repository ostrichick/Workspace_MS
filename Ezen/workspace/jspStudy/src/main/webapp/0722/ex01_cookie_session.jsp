<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie session</title>
</head>
<body>
  <h3>쿠키와 세션</h3>

  쿠키 - 웹에서 접근하거나 필요로하는 정보를 사용자 pc에 저장한 데이터
  <br /> - pc에 직접적으로 데이터를 담고 있기 때문에 보안 취약 (암호화 필요)
  <hr />
  세션 - 웹에서 접근하거나 필요한 정보 중 브라우저에 저장된 데이터
  <br />- 브라우저에 데이터를 담고 있기 때문에 종료시 데이터 사라짐

  <form action="ex01_addCookie.jsp" method="get">
    cookie: <input type="text" name="cookieData" /> <br /> <input
      type="submit"
    />
  </form>
  <form action="ex01_addSession.jsp">
    session : <input type="text" name="sessionData" /> <br /> <input type="submit" />
  </form>

</body>
</html>