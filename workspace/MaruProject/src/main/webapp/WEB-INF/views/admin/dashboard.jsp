<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
	<style>
		div {height:50px;}
		a {text-decoration:none; color:blue; font-weight:bold;}
	</style>
</head>
<body>

<h2>관리자 메인</h2>

<div>
	<a href="${pageContext.request.contextPath}/admin/memberList.do">회원 전체 목록</a>
</div>

<div>
	<a href="${pageContext.request.contextPath}/admin/member_updateList.do">회원정보 변경 목록</a>
</div>

<div>
	<a href="${pageContext.request.contextPath}/admin/member_deleteList.do">회원정보 삭제 목록</a>
</div>

<div>
	<a href="${pageContext.request.contextPath}/admin/file_upload.do">파일 업로드</a>
</div>

<div>
	<a href="${pageContext.request.contextPath}/">메인 페이지</a>
</div>


</body>
</html>