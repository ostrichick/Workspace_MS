<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
  <h3>파일 업로드</h3>
  <form action="upload_action.jsp" method="post" enctype="multipart/form-data">
    <input type="text" name="param1" />
    <input type="text" name="param2" />
    <input type="file" name="uploadFile" />
    <input type="file" name="uploadFile2" />
    <input type="file" name="uploadFile3" />
    <input type="submit" />
  </form>
</body>
</html>