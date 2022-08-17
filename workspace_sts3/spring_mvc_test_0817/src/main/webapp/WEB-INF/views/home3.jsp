<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home3</title>
</head>
<body>
<br>
<h2 style="color:blue">서버로 전달된 이름:${name}, 아이디:${id}</h2>
<br>

<h2>요청URL과 HomeController의 요청처리 메소드</h2>

<xmp style="font:25px bold;">
	요청 URL : ${pageContext.request.contextPath}/home/test3.do?name=홍길동2&id=hong2
	
	@GetMapping("/test3.do") //사용자의 요청정보에 포함된 파라미더들의 이름과 다른 이름으로 요청처리 메소드의 매개변수를
	//정의할 때 @RequestParam("파라미터의 name")로 파라미터 이름과 매개변수를 매칭시켜줘야 매개변수로 전달값을 받을 수 있음
	public String test3(@RequestParam("name") String member_name, @RequestParam("id") String member_id, Model model) {
		model.addAttribute("name", member_name);
		model.addAttribute("id", member_id);
		
		return "home3";
	}
</xmp>
</body>
</html>
