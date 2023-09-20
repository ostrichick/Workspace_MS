<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<script>
	var clickRow;
	function ajaxCall(bidx,obj){
		
		clickRow = $(obj).parent().parent();
		
		$.ajax({
			url:"detail.do",
			type:"post",
			data:"bidx="+bidx,
			success:function(data){
				var html = "";
				html += "글번호:<span id='vbidx'>"+data.bidx+"</span><br>";
				html += "글제목:<span id='vtitle'>"+data.title+"</span><br>";
				html += "작성자:<span id='vwriter'>"+data.mid+"</span><br>";
				html += "작성일:<span id='vregdate'>"+data.regdate+"</span><br>";
				html += "내용:<span id='vcontent'>"+data.content+"</span><br>";
				
				$("#view").prepend(html);
			}
		});
	}
	
	function modify(){
		var bidx,title,mid,content,regdate;
		
		bidx = $("#vbidx").text();
		title = $("#vtitle").text();
		mid = $("#vwriter").text();
		content = $("#vcontent").text();
		regdate = $("#vregdate").text();
		
		
		$("input[name=title]").val(title);
		$("input[name=content]").val(content);
		$("input[name=bidx]").val(bidx);
		$("#mid").text(mid);
		$("#regdate").text(regdate);
		
	}
	
	function ajaxModify(){
		$.ajax({
			url:"modify.do",
			type:"post",
			data: $("#modify").serialize(),
			success:function(data){
				clickRow.find("td:eq(1)").text(data.title);
				$("#vtitle").text(data.title);
				$("#vcontent").text(data.content);
			}
		});
	}
</script>
</head>
<body>
	<h2>게시판을 이용한 ajax 연습 페이지</h2>
	
	<!-- 전체 게시글 출력(ajax사용 X) home.do 포워드시 바로 출력 -->
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list}" var="item">
			<tr>
				<td>${item.bidx }</td>
				<td><a href="" onclick="ajaxCall(${item.bidx},this);return false;">${item.title }</a></td>
				<td>${item.mid }</td>
				<td>${item.regdate }</td>
			</tr>
		</c:forEach>
	</table>
	
	<div id="view">
		<!-- 위 테이블에서 제목을 클릭시 ajax 통신을 하여 게시글의 상세 정보를 출력 
			출력 정보 : 글 번호, 글 제목, 작성자 아이디, 글 내용, 작성일
		-->
		<button onclick="modify()">수정</button>
	</div>
	<!-- id view 영역에 있는 수정버튼 클릭시 script사용하여 상세 데이터 출력
	 	 후 저장 버튼 클릭시 수정 데이터 ajax를 사용하여 DB에 수정
	  -->
	<form id="modify">
		<input type="hidden" name="bidx">
		<p>
			글제목 : <input type="text" name="title">
		</p>
		<p>
			작성자:	<span id="mid"></span>
		</p>
		<p>
			작성일: <span id="regdate"></span>
		</p>
		<p>
			글내용 : <input type="text" name="content">
		</p>
		<button type="button" onclick="ajaxModify()">저장</button>
	</form>
	
</body>
</html>








