<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL 내장 객체사용</title>
</head>
<body>
	<h2>EL 내장객체</h2>
	<p>session 객체에 저장한 member_id 값 : ${member_id}</p>
	<p>cookie에 저장한 장바구니의 제품번호 : ${cookie.CART01.value}</p>
	<p>
		request 객체에 저장한 Product 객체 정보 <br>이름: ${product.name} <br>가격:
		${product.price}
	</p>

	<h2>계절과 메뉴 설문조사</h2>
	<form action="${pageContext.request.contextPath}/send_survey.do"
		method="post">
		좋아하는 계절<br> <input type="radio" name="season" value="봄" />봄
		&nbsp;&nbsp; <input type="radio" name="season" value="여름" />여름
		&nbsp;&nbsp; <input type="radio" name="season" value="가을" />가을
		&nbsp;&nbsp; <input type="radio" name="season" value="겨울" />겨울
		&nbsp;&nbsp; <br> 좋아하는 메뉴<br> <input type="checkbox"
			name="menu" value="냉면">냉면 &nbsp;&nbsp;<input type="checkbox"
			name="menu" value="불고기">불고기 &nbsp;&nbsp;<input
			type="checkbox" name="menu" value="비빔밥">비빔밥 &nbsp;&nbsp;<input
			type="checkbox" name="menu" value="탕수육">탕수육 &nbsp;&nbsp;
		<p>
			<input type="submit" value="보내기"> &nbsp;&nbsp; <input
				type="reset" value="취소">
		</p>
	</form>




</body>
</html>