<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%
//쿠키 조회하기
Cookie[] cookies = request.getCookies(); // 전체 쿠키를 배열로 한번에 가져와서 원하는 쿠키를 찾고, 그 쿠키의 값을 가져와야함
String result = "";
for (Cookie cookie : cookies) {
	String cookieKey = cookie.getName(); // 현재 접근 중인 쿠키의 키
	String cookieValue = cookie.getValue(); // 현재 접근 중인 쿠키의 값
	if (cookieKey.equals("cookieTest")) {
		result = cookieValue;
		out.print(cookie.getPath());
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키확인</title>
</head>
<body>
  <h2>
    입력된 cookie의 값 :
    <%=result%></h2>

  <button onclick="delCookie()">쿠키삭제</button>
  <script>
			function delCookie() {
				location.href = "ex01_delCookie.jsp";
			}
		</script>
</body>
</html>