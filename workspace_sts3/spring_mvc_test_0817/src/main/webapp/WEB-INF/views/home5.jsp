<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home5</title>
</head>
<body>
<br>
<h2 style="color:blue">서버로 전달된 제품번호:${product_id}, 국가코드: ${country_id}</h2>
<br>

<h2>요청URL과 HomeController의 요청처리 메소드</h2>

<xmp style="font:25px bold;">
	요청 URL : ${pageContext.request.contextPath}/home/P0001/C001/test5.do
	
	@GetMapping("/{prod_id}/{country_id}/test5.do") //경로변수로 여러 개의 값을 받아서 요청처리 메소드에서 사용하는 경우
	public String test5(@PathVariable("prod_id") String product_id, 
			@PathVariable("country_id") String country_id,Model model) {
		model.addAttribute("product_id", product_id);
		model.addAttribute("country_id", country_id);
		
		return "home5";
	}
</xmp>
</body>
</html>
