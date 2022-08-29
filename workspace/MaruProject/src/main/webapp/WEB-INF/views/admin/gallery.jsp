<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>갤러리</title>
<style>
	div {float:left;}
</style>
</head>
<body>

<h3>업로드된 파일 갤러리</h3>
<hr>
	<c:forEach var="fileVo" items="${fileList}">
		
		<c:if test="${not empty fileVo.origin_filename1}">
			<div>
				<img src="${pageContext.request.contextPath}/resources/upload/s_${fileVo.origin_filename1}" 
					style="width:300px;height:200px;"/>
			</div>
		</c:if>
		<c:if test="${not empty fileVo.origin_filename2}">
			<div>
				<img src="${pageContext.request.contextPath}/resources/upload/s_${fileVo.origin_filename2}" 
					style="width:300px;height:200px;"/>
			</div>
		</c:if>
		<c:if test="${not empty fileVo.origin_filename3}">
			<div>
				<img src="${pageContext.request.contextPath}/resources/upload/s_${fileVo.origin_filename3}" 
					style="width:300px;height:200px;"/>
			</div>
		</c:if>
		
	</c:forEach>
	


</body>
</html>