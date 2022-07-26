<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//스크립틀릿 - jsp에서 java 실행문을 선언하는 영역
 int num1 = 10;
 int num2 = 20;
 
 int[] iArray = {1,2,3,4,5,6,7,8,9,10};
 
 int sum =0;
 for(int i :iArray){
	 sum += i;
 }
 
 String[] strArray = {"안녕하세요","jsp 처음 배워요","무슨말인지 모르겠어요","잘부탁드립니다"};
 
 
 int[][] iArray2 = {{1,2,3},{4,5,6},{7,8,9}};
 //iArray2 이차원 배열을 표로 jsp를 사용하여 출력하세요
 //이차원 배열의 행의 길이 배열.length
 //이차원 배열의 열의 길이 배열[행인덱스].length
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>  
<body>
 첫번째 jsp 입니다.
 <%=10 %><!-- 익스프레션 태그 -jsp에서 연산식 또는 데이터 또는 변수를 사용하는 영역 -->
 /
 <%= num1 %>
 /
 <%= num2 %>
 /
 <%= num1+num2 %>
 <br>
 num1이 num2보다 큰지에 대한 결과를 익스프레션 태그를 이용하여 출력하세요.
 <br>
 <%=num1>num2 %>
 <br>
 <%= sum %>
 <!-- 
 	이클립스를 통하지 않고 jsp를 톰캣으로 바로 실행했을 경우
 	jsp에 대한 서블릿 클래스 파일은 톰캣의 work/catalina/org/apache/jsp 안쪽을 쌓인다.
  -->
  <br>
  <table border="1">
  	<%
  		for(String str:strArray){
  			
  	%>
  		<tr>  	
  		  	<td><%=str %></td>
  	  	</tr>
  	<%	
  		}
  	
  		if(strArray.length == 0){
  		%>	
  			<tr><td>데이터가 없습니다.</td></tr>
  		<%
  		}
  	%>
  	<!-- tr>
  		<td>안녕하세요</td>
  	</tr>
  	<tr>
  		<td>jsp 처음배워요</td>
  	</tr>
  	<tr>
  		<td>무슨말인지 잘 모르겠어요</td>
  	</tr>
  	<tr>
  		<td>잘부탁드립니다.</td>
  	</tr-->
  </table>
  
  <table border="1">
  <%
  	for(int i=0; i<iArray2.length;i++){
  		//for(int[] i: iArray2){
  		
  %>
  		<tr>
  <%
  		for(int j=0; j<iArray2[i].length;j++){
  			//for(int j: i)	
  		
  			 %>
  			<td><%=iArray2[i][j] %><%-- <%= j %> --%></td>
  			 <%
  			
  		}
  %>
  	</tr>
  <%
  	}
  %>
  </table>
  
</body>
</html>








