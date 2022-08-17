<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home2</title>
</head>
<body>
<br>
<h2 style="color:blue">서버에 전달된 이름:${name}, 아이디:${id}</h2>
<br>

<h2>요청URL과 HomeController의 요청처리 메소드</h2>

<xmp style="font:25px bold;">
	요청 URL : ${pageContext.request.contextPath}/home/test2.do?name=홍길동&id=hong
	
	@GetMapping("/test2.do") //사용자의 요청정보에 포함된 전달값들을 요청처리 메소드의 매개변수로 받을 수 있음
	public String test2(String name, String id, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		
		return "home2";
	}
</xmp>

</body>
</html>
