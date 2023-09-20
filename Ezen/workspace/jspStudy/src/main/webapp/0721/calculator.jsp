<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
  <h2>계산기 만들기</h2>
  <!-- 계산하기 버튼을 누르면 입력 양식 값들을 calculator_result.jsp로 전송
		연산 결과를 출력 -->
  <form action="calculator_result.jsp">
    <p>
      피연산자1 : <input type="number" name="num1" />
    </p>
    <br />
    <p>
      연산자 <br /> 
      <input type="radio" name="oper" value="plus" /> + <br />
      <input type="radio" name="oper" value="minus" /> - <br />
      <input type="radio" name="oper" value="multi" /> * <br />
      <input type="radio" name="oper" value="divide" /> /
    </p>
    <br />
    <p>
      피연산자2 : <input type="number" name="num2" />
    </p>
    <br /> <input type="submit" value="계산하기" />

  </form>
</body>
</html>