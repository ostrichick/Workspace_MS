<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 업로드 예제 페이지</h2>
	<form action="upload.do" method="post" enctype="multipart/form-data">
		파일 업로드 : <input type="file" name="fileupload">
		<br>
		 게시글 제목 : <input type="text" name="title">
		<br>
		
		 게시글 내용 : <input type="text" name="content">
		<br>
		<button>전송</button>
	</form>
</body>
</html>