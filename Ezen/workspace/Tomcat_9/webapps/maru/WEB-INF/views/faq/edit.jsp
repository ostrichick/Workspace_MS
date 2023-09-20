<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>자주묻는 질문(FAQ) 수정</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
</head>
<body class="animsition"> 
<%@include file="/include/header.jsp"%>
<br><br>
	<h3 style="text-align:center;">자주묻는 질문(FAQ) 수정</h3>  
	<div class="container" style="width:500px; height:400px; border:1px solid; "> 
		<div style="margin:0 10px;">
		    <form action="write_process" id="writeForm" method="post" enctype="multipart/form-data">
		    <br>
		      <select>
		      	<option>선택</option>  
		        <option>거실</option>
		        <option>침실</option>
		 		<option>드레스룸</option> 
		       	<option>서재</option> 
		    	<option>주방</option> 
		      	<option>욕실</option>
		      </select>
		      <hr>
		      <input type="text" name="title" class="form-control mt-4 mb-2" placeholder="제목을 입력해주세요." required>
		      <hr>
		      <div class="form-group" style="border:1px solid;">
		       <textarea id="summernote" name="content" placeholder="내용을 입력해주세요." cols="57" rows="6"></textarea>
		      </div>  
		      <button type="submit" id="faq_submit" class="btn btn-secondary mb-3">수정</button>
		      <button type="submit" id="faq_retrun" class="btn btn-secondary mb-3">취소</button>
		    </form>
	    </div>
	 </div>
	 <br><br><br><br>
  

 <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/detail.jsp"%>
  <%@include file="/include/script.jsp"%>
  <script type="text/javascript">
  $("#faq_retrun").on("click", function(e){
		
		location.href = "${MaruContextPath}/index";
});
  
  </script>
</body>
</html>