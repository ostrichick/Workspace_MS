<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="boardStudy.Board" %>
<%@ page import="java.util.*" %>    
<%
	pageContext.setAttribute("num1",20);

	String[] strs = {"가","나","다","라"};
	pageContext.setAttribute("strs",strs);
	
	Board b1 = new Board();
	b1.setTitle("첫번째 게시글입니다.");
	Board b2 = new Board();
	b2.setTitle("두번째 게시글입니다.");
	Board b3 = new Board();
	b3.setTitle("세번째 게시글입니다.");
	Board b4 = new Board();
	b4.setTitle("네번째 게시글입니다.");
	
	ArrayList<Board> blist = new ArrayList<>();
	blist.add(b1);
	blist.add(b2);
	blist.add(b3);
	blist.add(b4);
	
	pageContext.setAttribute("blist",blist);
	
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="sample" value="${num1}" />
	${sample+10}
	<c:remove var="sample" />
	${empty sample}
	
	<c:if test="${num1>10}">
		true 이면 출력됩니다.
	</c:if>
	
	<!-- 
	jstl choose 태그는 자바의 switch case 문과 유사하지만 true false의 값을 비교하여
	해당하는 첫번째 when 절만 실행한다.
	 -->
	<c:choose>
		<c:when test="${num1 > 10}">
			num1은 10보다 큽니다.
		</c:when>
		<c:when test="${num1 > 5 }">
			num1은 5보다 큽니다.
		</c:when>
		<c:otherwise>
			위의 조건을 모두 해당하지 않습니다.
		</c:otherwise>
	</c:choose>
	
	
	<br>
	<c:forEach begin="1" end="10" step="2" varStatus="state">
		${state.count}
	</c:forEach>
	
	
	${strs[0]}
	${strs[1]}
	${strs[2]}
	${strs[3]}
	<!-- 
		for(String str:strs)
	 -->
	<c:forEach items="${strs}" var="str">
		${str}
	</c:forEach>
	
	
	<table border="1">
	<tr>
		<th>제목</th>
	</tr>
	<c:forEach items="${blist }" var="board">
		<tr>
			<td>${board.title}</td>
		</tr>
	</c:forEach>
	</table>
	
</body>
</html>


