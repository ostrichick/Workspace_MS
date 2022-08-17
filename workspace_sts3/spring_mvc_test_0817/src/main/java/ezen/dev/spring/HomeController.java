package ezen.dev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/home")
public class HomeController {

	private MemberInsertService memberInsertService;

	@Autowired(required = false)
	public void setMemberInsertService(MemberInsertService memberInsertService) {
		this.memberInsertService = memberInsertService;
	}

	@GetMapping("/sample.do")
	public String sample(Model model) {
		return "sample";
	}

	@GetMapping("/test.do") // 사용자의 요청정보를 처리하는 요청처리 메소드 정의
	public String test() {
		return "home"; // 요청 처리결과를 가지고 화면을 구성하는 View 페이지 이름을 DispatcherServlet으로 반환함
	}

	@GetMapping("/test2.do") // 사용자의 요청정보에 포함된 전달값들을 요청처리 메소드의 매개변수로 받을 수 있음
	public String test2(String name, String id, Model model) {
		model.addAttribute("name", name);
		model.addAttribute("id", id);

		return "home2";
	}

	@GetMapping("/test3.do") // 사용자의 요청정보에 포함된 파라미더들의 이름과 다른 이름으로 요청처리 메소드의 매개변수를
	// 정의할 때 @RequestParam("파라미터의 name")로 파라미터 이름과 매개변수를 매칭시켜줘야 매개변수로 전달값을 받을 수 있음
	public String test3(@RequestParam("name") String member_name, @RequestParam("id") String member_id, Model model) {
		model.addAttribute("name", member_name);
		model.addAttribute("id", member_id);

		return "home3";
	}

	@GetMapping("/test4/{prod_id}") // 사용자의 요청 경로정보를 통해 동적으로 값을 전달하고자 할 경우 경로정보를 경로변수로
	// 정의하고 요청처리 메소드에서는 @PathVariable("경로변수명")을 매개변수 앞에 붙여서 경로변수에 저장된 값을 받을 수 있음
	public String test4(@PathVariable("prod_id") String product_id, Model model) {
		model.addAttribute("product_id", product_id);

		return "home4";
	}

	@GetMapping("/{prod_id}/{country_id}/test5.do") // 경로변수로 여러 개의 값을 받아서 요청처리 메소드에서 사용하는 경우
	public String test5(@PathVariable("prod_id") String product_id, @PathVariable("country_id") String country_id,
			Model model) {
		model.addAttribute("product_id", product_id);
		model.addAttribute("country_id", country_id);

		return "home5";
	}

	@GetMapping("/test6.do")
	public String test6(MemberVo memberVo, Model model) {
		return "home6";
	}

	@PostMapping("/test7.do") // MemberVo는 커맨드 객체(폼 전송을 처리하는 컨트롤러 메소드에서 요청 파라미터 값을 저장하는데
	// 사용되는 자바 객체), 요청 파라미터 값을 전달받을 수 있도록 Setter 메소드를 포함하고 있어야 함, 폼의 <input>태그의
	// name값과
	// 일치하는 필드에만 입력값을 저장함, JSP페이지에서 커맨드 객체를 사용하려면 첫 글자를 소문자로 바꾼 클래스 이름으로 커맨드 객체를
	// 사용할 수 있음
	public String test7(MemberVo memberVo, Model model) {
		model.addAttribute("memberVo", memberVo);

		return "home7";
	}

	@GetMapping("/ajax.do")
	public String ajax() {
		return "ajax_ex01";
	}

	@GetMapping("/ajax2.do")
	public String ajax2() {
		return "ajax_ex02";
	}

	@GetMapping("/ajax3.do")
	public String ajax3() {
		return "ajax_ex03";
	}

	@GetMapping("/ajax4.do")
	public String ajax4() {
		return "ajax_ex04";
	}

	@GetMapping("/ajax5.do")
	public String ajax5() {
		return "ajax_ex05";
	}

	@GetMapping("/ajax6.do")
	public String ajax6() {
		return "ajax_ex06";
	}

	@GetMapping("/ajax7.do")
	public String ajax7() {
		return "ajax_ex07";
	}

	@GetMapping("/ajax8.do")
	public String ajax8() {
		return "ajax_ex08";
	}

	@GetMapping("/ajax02_ex01.do")
	public String ajax02_ex01() {
		return "ajax02_ex01";
	}

	@GetMapping("/ajax02_ex02.do")
	public String ajax02_ex02() {
		return "ajax02_ex02";
	}

	@GetMapping("/ajax02_ex03.do")
	public String ajax02_ex03() {
		return "ajax02_ex03";
	}

	@GetMapping("/ajax02_ex04.do")
	public String ajax02_ex04() {
		return "ajax02_ex04";
	}

	@GetMapping("/db_test.do")
	public String db_test() {
		return "db_test";
	}

	@PostMapping("/db_test2.do")
	public String db_test2(MemberVo memberVo, Model model) {
		int result = 0;// 0:입력실패

		result = memberInsertService.insert(memberVo);

		if (result == 1)
			model.addAttribute("result", "입력 성공");
		else
			model.addAttribute("result", "입력 실패");

		return "db_test";
	}

}
