<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>java_collection</title>
</head>
<body>
	<h4>배열 예제: 우승자 명단</h4>
	<ol>
		<li>${winners[0]}</li>
		<li>${winners[1]}</li>
		<li>${winners[2]}</li>
	</ol>
	<h4>List 예제: 구매한 과일</h4>
	<ul>
		<li>${items[0]}</li>
		<li>${items[1]}</li>
		<li>${items[2]}</li>
		<li>${items[3]}</li>
	</ul>
	<h4>Map 예제 : 주소록</h4>
	<ul>
		<li>${addressBook["전주시청"]}</li>
		<li>${addressBook["청와대"]}</li>
		<li>${addressBook["에버랜드"]}</li>
		<li>${addressBook["독도"]}</li>
	</ul>
</body>
</html>