<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Home7</title>
</head>
<body>
<br>
<h2 style="color:blue">
서버로 전달된 아이디:${memberVo.member_id}, 비밀번호: ${memberVo.member_pw}, 이름: ${memberVo.member_name}<br>
관심분야:
<c:forEach var="field" items="${memberVo.field_interests}">
	${field}&nbsp;&nbsp;
</c:forEach>
</h2>
<br>

<h2>요청URL과 HomeController의 요청처리 메소드</h2>

<xmp style="font:25px bold;">
	요청 URL : ${pageContext.request.contextPath}/home/test7.do
	
	@PostMapping("/test7.do") //MemberVo는 커맨드 객체(폼 전송을 처리하는 컨트롤러 메소드에서 요청 파라미터 값을  저장하는데
	//사용되는 자바 객체), 요청 파라미터 값을 전달받을 수 있도록 Setter 메소드를 포함하고 있어야 함, 폼의 <input>태그의 name값과 
	//일치하는 필드에만 입력값을 저장함, JSP페이지에서 커맨드 객체를  사용하려면  첫 글자를 소문자로 바꾼 클래스 이름으로 커맨드 객체를
	//사용할 수 있음   
	public String test7(MemberVo memberVo,Model model) {
		model.addAttribute("memberVo", memberVo);	
		
		return "home7";
	}
</xmp>


</body>
</html>
