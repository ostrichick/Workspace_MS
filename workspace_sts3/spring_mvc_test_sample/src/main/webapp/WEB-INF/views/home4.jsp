<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home4</title>
</head>
<body>
<br>
<h2 style="color:blue">서버로 전달된 제품번호:${product_id}</h2>
<br>

<h2>요청URL과 HomeController의 요청처리 메소드</h2>

<xmp style="font:25px bold;">
	요청 URL : ${pageContext.request.contextPath}/home/test4/100
	
	@GetMapping("/test4/{prod_id}") //사용자의 요청 경로정보를 통해 동적으로 값을 전달하고자 할 경우 경로정보를 경로변수로
	//정의하고 요청처리 메소드에서는 @PathVariable("경로변수명")을 매개변수 앞에 붙여서 경로변수에 저장된 값을 받을 수 있음
	public String test4(@PathVariable("prod_id") String product_id, Model model) {
		model.addAttribute("product_id", product_id);
		
		return "home4";
	}
</xmp>
</body>
</html>
