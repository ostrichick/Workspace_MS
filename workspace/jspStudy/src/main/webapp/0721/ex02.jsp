<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<!-- 지시자 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
		border: 3px solid red;
		height: 20vh;
}

section {
		border: 3px solid green;
		height: 50vh;
}

footer {
		border: 3px solid orange;
		height: 15vh;
}
</style>
</head>
<body>
		<%@include file="/header.jsp"%>
		<section>
				d여기는 본문이오d
				<h2>스크립트 요소</h2>
				<ul>
						<li>선언부 - 현재 페이지에서 사용할 메소드 정의 &lt;%! %&gt;</li>
						<%!//선언부
	public int sum(int num1, int num2) {
		System.out.println(num1 + num2);
		return num1 + num2;
	}
					//	System.out.println(num1 + num2);
	%>
						<li>스크립틀릿 - 현재 페이지에서 자바 실행문을 작성하는 구간 &lt;% %&gt;
						<%
						System.out.println("스크립틀릿에서 출력 가능");
						%>
						
						</li>
						<li>표현식(익스프레션) - 값을 표현하는 문법 &lt;%= %&gt;
						<%=sum(10,20) %>
						</li>
				</ul>
		</section>
		<%@include file="/footer.jsp"%>
</body>
</html>