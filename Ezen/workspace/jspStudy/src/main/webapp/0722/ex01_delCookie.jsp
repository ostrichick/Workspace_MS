<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<%
//쿠키제거
Cookie[] cookies = request.getCookies();
for (Cookie cookie : cookies) {
	if (cookie.getName().equals("cookieTest")) {
		cookie.setMaxAge(0); // 지우거나 수정하는 방법은 없고 유효기간을 0으로 덮어씌워야함
		response.addCookie(cookie);
		break;
	}
}
response.sendRedirect("ex01_cookie.jsp");
%>