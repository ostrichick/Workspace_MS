<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%
String sessionData = (String) session.getAttribute("sessionTest"); // Object객체를 String으로 강제형변환
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 확인</title>
</head>
<body>
  <h2>
    sessionData :
    <%=sessionData%></h2>
  <button onclick="initSession()">세션 초기화</button>
  <script>
			function initSession() {
				location.href = "ex01_initSession.jsp";
			}
		</script>
</body>
</html>