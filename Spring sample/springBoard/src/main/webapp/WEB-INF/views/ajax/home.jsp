<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	function ajax1(){
		$.ajax({
			url:"sample1.do",
			type:"get",
			success:function(data){
				$("#result").html(data);
			},
			error:function(){
				console.log("ajax error");
			}
		});
	}
	function adminInfo(){
		$.ajax({
			url:"adminInfo.do",
			type:"get",
			success:function(data){
				var html ="회원 번호 :"+data.midx +"<br>";
				html +="회원 아이디 :"+data.mid +"<br>"
				html +="회원 비밀번호 :"+data.password +"<br>"
				html +="회원 주소 :"+data.addr +"<br>"
				html +="회원 연락처 :"+data.phone +"<br>"
				html +="회원 가입일 :"+data.regdate +"<br>"
				
				
				$("#result").html(html);
				
				
				
			},error:function(){
				console.log("ajax error");
			}
			
		});
	}
	function boardPrint(){
		$.ajax({
			url:"boardPrint.do",
			type:"get",
			/*data : "bidx=1",*/
			success:function(data){
				console.log(data);
				var html = "";
				for(var i=0; i<data.length;i++){
					html += "게시글 번호 : "+data[i].bidx +"<br>";
					html += "게시글 제목 : "+data[i].title +"<br>";
					html += "게시글 작성자 : "+data[i].mid +"<br>";
					html += "게시글 작성일 : "+data[i].regdate +"<br>";
				}
				
				$("#result").html(html);
				
			}
		});
	}
</script>
</head>
<body>
	<h2>Ajax 연습 페이지</h2>
	
	<button onclick="ajax1()">ajax 통신1</button>
	<button onclick="adminInfo()">admin 유저 정보 출력</button>
	<button onclick="boardPrint()">게시글 전체 출력</button>
	
	<div id="result">
	
	</div>
	
	
</body>
</html>