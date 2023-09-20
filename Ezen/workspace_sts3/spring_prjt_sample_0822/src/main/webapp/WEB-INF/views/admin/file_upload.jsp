<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드</title>
</head>
<body>
	<h4>파일 업로드</h4>
	<form
		action="${pageContext.request.contextPath}/admin/upload_process.do"
		method="post" enctype="multipart/form-data">
		최대 3개 업로드 <br> <input type="file" name="uploadFile" multiple />
		<br /> <input type="submit" value="업로드" />
	</form>
</body>
</html>