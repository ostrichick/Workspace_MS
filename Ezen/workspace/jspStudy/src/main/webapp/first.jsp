<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"
%>
<!DOCTYPE html>

<html>
<head>
<%
//스크립틀릿 - jsp에서 java 실행문을 선언
%>
<meta charset="UTF-8" />
<%
int num1 = 10;
int num2 = 20;
int[] iArray = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 };
int sum = 0;
for (int i : iArray) {
	sum += i;
}
%>
<title>ㅇㅅㅇㅅㅇ</title>
<style>
.n td {
		width: 30px;
		height: 30px;
}
</style>
</head>
<body>
		<%=sum%>
		${sum}
		<!-- 이클립스를 통하지 않고 jsp를 톰캣으로 바로 실행했을 경우 
    jsp에 대한 서블릿 클래스 파일은 톰캣의 work/catalina/org/apache/jsp 안쪽에 쌓인다 -->
		<h1>ㅇㅅㅇㅅㅇ</h1>
		<%
		String[] strArray = { "안녕하세요", "jsp 처음 배워요", "무슨 말인지 모르겠어요", "잘부탁드립니다" };
		int[][] iArray2 = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
		%>
		첫뻔재 jsp
		<ul>
				<li>fsdf</li>
				<li>df</li>
		</ul>
		<%=10%><!-- 익스프레션 태그-  jsp에서 연산식, 데이터, 변수를 사용하는 영역 -->
		/
		<%=num1%>
		/
		<%=num2%>
		/
		<%=num1 + num2%>
		<br />num1이 num2보다 큰지에 대한 결과를 출력
		<br /><%=num1 > num2%><br />
		<br />
		<table border="1">
				<%
				for (String str : strArray) {
				%>
				<tr>
						<td><%=str%></td>
				</tr>
				<%
				}
				%>
		</table>
		<table class="n" border="1">
				<%
				for (int i = 0; i < iArray2.length; i++) {
				%>
				<tr>
						<%
						for (int j = 0; j < iArray2[i].length; j++) {
						%>
						<td><%=iArray2[i][j]%></td>
						<%
						}
						%>
				</tr>
				<%
				}
				%>
		</table>
		<table class="n" border="1">
				<%
				for (int[] i : iArray2) {
					//for(int[] i:iArray2){
				%>
				<tr>
						<%
						for (int j : i) {
							//for(int j:i)
						%>
						<td><%=j%></td>
						<%
						// j
						}
						%>
				</tr>
				<%
				}
				%>
		</table>

		<table class="h" border="1">
				<%
				for (int i = 2; i < 10; i++) {
				%>
				<tr>
						<%
						for (int j = 1; j < 10; j++) {
						%>
						<td><%=i + "x" + j + "=" + i * j%></td>
						<%
						}
						%>
				</tr>
				<%
				}
				%>
		</table>
		<table class="h" border="1">
				<%
				for (int i = 2; i < 10; i++) {
				%>
				<tr>
						<%
						for (int j = 0; j < 10; j++) {
							if (j != 0) {
						%>
						<td><%=i + "x" + j + "=" + i * j%></td>
						<%
						} else if (j == 0){
						%><td><%=i + "단"%></td>
						<%
						}}
						%>
				</tr>
				<%
				}
				%>
		</table>
		<jsp:attribute name=""></jsp:attribute>
</body>
</html>
