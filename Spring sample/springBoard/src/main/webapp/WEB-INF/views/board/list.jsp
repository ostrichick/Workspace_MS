<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 목록 화면</h2>
	<form name="searchfrm" action="list.do" method="get">
		<select name="searchType">
			<option value="title" <c:if test="${searchVO.searchType eq 'title'}">selected</c:if>>제목</option>
			<option value="writerId" <c:if test="${searchVO.searchType eq 'writerId'}">selected</c:if>>작성자아이디</option>
		</select>
		<input type="text" name="searchValue" <c:if test="${searchVO.searchValue ne null }">value="${searchVO.searchValue }"</c:if>>
		<button>검색</button>
	</form>
	<table border="1">
		<tr>
			<th width="10%">글번호</th>
			<th>제목</th>
			<th width="20%">작성자</th>
			<th width="20%">작성일</th>
		</tr>
		<c:if test="${list.size() > 0 }">
			<c:forEach var="item" items="${list}">
			<tr>
				<td>${item.bidx }</td>
				<td><a href="view.do?bidx=${item.bidx}">${item.title }</a></td>
				<td>${item.mid }</td>
				<td>${item.regdate }</td>
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${list.size() == 0 }">
			<tr>
				<td colspan="4">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
	</table>
	<c:if test="${login ne null }">
	<p>
		<button onclick="location.href='register.do'">등록</button>
	
	</p>
	</c:if>
</body>
</html>