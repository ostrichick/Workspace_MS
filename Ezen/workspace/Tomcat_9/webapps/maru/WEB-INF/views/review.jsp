<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">  
<title>리뷰</title>
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.png" />
<link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/starrate.png" />
<<<<<<< Updated upstream
=======
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>
  
  <!-- breadcrumb -->
<div class="container" >
<h3 class="col-2" style="float:left ;">리뷰 페이지</h3>
<div style="border-left:100;"></div>
	<div style="float:left;">
	리뷰를 등록해주세요.
	</div>
</div>
<br>
<br>
<div class="container text-center" style="border-style:solid; margin-top:10px;">
	<div class="row" style="margin-top: 25px;">
	  <div class="col-2">
		*별점
		</div>
		<div class="rating">
			<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
			<input type="checkbox" name="star" id="rating1" value="1" class="rate_radio" title="1점">
			<label for="rating1"></label>
			<input type="checkbox" name="star" id="rating2" value="2" class="rate_radio" title="2점">
			<label for="rating2"></label>
			<input type="checkbox" name="star" id="rating3" value="3" class="rate_radio" title="3점" >
			<label for="rating3"></label>
			<input type="checkbox" name="star" id="rating4" value="4" class="rate_radio" title="4점">
			<label for="rating4"></label>
			<input type="checkbox" name="star" id="rating5" value="5" class="rate_radio" title="5점">
			<label for="rating5"></label>
		</div>
	</div>
	<hr>
	<br><br><br>
	<hr>
	<div class="row">
	<div class="col-2">
		*내용
	  </div>
	  <div class="col-8">
		<textarea style="border-style:solid; width:400px; height:150px;" name="content" id="re_content"></textarea>
	</div>
	</div>
	<hr>
	<div class="row">
	<div class="col-2">
		*파일첨부
	 </div>
	<div class="col-8" style="margin-bottom:30px;">
	<div class="filebox">
		<input class="upload-name" value="첨부파일" placeholder="첨부파일">
		<label for="file">파일찾기</label> 
		<input type="file" id="file">
	</div>
	</div>
	</div>
</div>
<div style="margin-left:40%; margin-top:50px; margin-bottom:50px;">
<a id="re_submit" class="btn btn-primary" type="submit"  style="margin-right:30px ;">등록</a>
<a id="re_reset" class="btn btn-primary" type="reset" >취소</a>
</div>


 <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
  <%@include file="/include/style.jsp"%>
<!-- =========================================== -->
<script type="text/javascript">
$("#re_submit").on("click", function(e){
	
	 memberId = '${memberId}';
	 rating = $("rating").val();
	 file = $("file_original").val();
	 content = $("textarea").val();

	 data = {
			memberId : memberId,
			rating : rating,
			file : file,
			content : content
	}
}
	
	$.ajax({
		data : data,
		type : 'POST',
		url : '/member/myinfo',
		success : function(result){
			window.close();
			location.href = "${MaruContextPath}/index";
});
</script>	
<script type="text/javascript">
$("#re_reset").on("click", function(e){
	 location.href = "${MaruContextPath}/member/myinfo";
});	

</script>
<!-- =========================================== -->
<!-- =========================================== -->
>>>>>>> Stashed changes
 <style>
 #container{
		width:700px;
	}
 
 #filename{ 
 	margin-bottom:.5rem; 
 }
 
 #re_content{
 	border:1px solid #666; 
 	width:400px; 
 	height:150px;
 	margin-left:10px;
 }
 
.filebox .upload-name {
    display: inline-block;
    height: 40px; 
    padding: 0 10px;
    vertical-align: middle; 
    border: 1px solid #dddddd;
    width: 78%; 
    color: #999999;
}
.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    vertical-align: middle;
    background-color: #999999;
    cursor: pointer;
    height: 40px; 
}
.filebox input[type="file"] {
    position: absolute;
    width: 0;
    height: 0; 
    padding: 0;
    overflow: hidden;
    border: 0;
}
</style>
<script>
$("#file").on('change',function(){
  var fileName = $("#file").val();
  $(".upload-name").val(fileName);
});

</script>
<!--=============================================================================-->
<style>
.rating .rate_radio {
    position: relative;
    display: inline-block;
    z-index: 20;
    opacity: 0.001;
    width: 60px;
    height: 60px;
    background-color: #fff;
    cursor: pointer;
    vertical-align: top;
    display: none;
}
.rating .rate_radio + label {
    position: relative;
    display: inline-block;
    margin-left: -4px;
    z-index: 10;
    width: 60px;
    height: 60px;
    background-image: url('./resources/images/icons/starrate.png'); 
    background-repeat: no-repeat;
    background-size: 60px 60px;
    cursor: pointer;
    background-color: #f0f0f0;
}
.rating .rate_radio:checked + label {
    background-color: #ff8;
}
</style>
</head>
<body class="animsition">
  <%@include file="/include/header.jsp"%>

<div class="container m-t-50" >
<h3 class="col-2 m-l-220" style="float:left ;">리뷰 페이지</h3>
	<div style="float:left;">  
	리뷰를 등록해주세요. 
	</div> 
</div>   
<br>
<br> 
<div class="container text-center m-t-10 bor4" id="container"> 
<form action="" method="post" id="review_write">
	<div class="row" style="margin-top: 25px;">
	  <div class="col-2" style="margin-top:20px;"> 
		*별점 
		</div>
		<div class="rating" style="margin-left:20px;">
			<!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
			<input type="checkbox" name="star" id="rating1" value="1" class="rate_radio" title="1점">
			<label for="rating1"></label>
			<input type="checkbox" name="star" id="rating2" value="2" class="rate_radio" title="2점">
			<label for="rating2"></label>
			<input type="checkbox" name="star" id="rating3" value="3" class="rate_radio" title="3점" >
			<label for="rating3"></label>
			<input type="checkbox" name="star" id="rating4" value="4" class="rate_radio" title="4점">
			<label for="rating4"></label>
			<input type="checkbox" name="star" id="rating5" value="5" class="rate_radio" title="5점">
			<label for="rating5"></label>
		</div>
	</div>
	<hr>
	<br><br><br>
	<hr>
	<div class="row">
	<div class="col-2 m-t-50"> 
		*내용
	  </div>
	  <div class="col-8">
		<textarea  name="content" id="re_content"></textarea>
	</div>
	</div> 
	<hr> 
	<div class="row">
	<div class="col-2 m-t-10"> 
		*파일첨부
	 </div>
	<div class="col-8 m-b-20">   
	<div class="filebox" id="filebox">
		<input class="col-8 upload-name" id="filename" value="첨부파일" placeholder="첨부파일">
		<label for="file">파일찾기</label> 
		<input type="file" id="file" class="col-1">
	</div> 
	</div>
	</div>
</form>
</div>
<div style="margin-left:40%; margin-top:50px; margin-bottom:50px;">
<a id="re_submit" class="btn btn-dark bg1 cl0" type="submit"  style="margin-right:30px ;"><span class="cl0">등록</span></a> 
<a id="re_reset" class="btn btn-dark bg1 cl0" type="reset" ><span class="cl0">취소</span></a>  
</div> 


 <!-- Footer -->
  <%@include file="/include/footer.jsp"%>
  <%@include file="/include/script.jsp"%>
<!-- =========================================== -->
<script type="text/javascript">
$("#re_submit").on("click", function(e){
	location.href = "${MaruContextPath}/index";
});
</script>	
<script type="text/javascript">
$("#re_reset").on("click", function(e){
	 location.href = "${MaruContextPath}/index";
});	

</script>
<!-- =========================================== -->
<!-- =========================================== -->
<script>

function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}
let rating = new Rating();//별점 인스턴스 생성

document.addEventListener('DOMContentLoaded', function(){
    //별점선택 이벤트 리스너
    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
        }
    })
});

</script>
<!--========================================================================================-->
</body>
</html>