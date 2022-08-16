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
@RequestMapping("/home") // 컨트롤러 요청URL의 공통부분은 클래스위에
// @RequestMapping("경로") 붙여서 메소드에 붙은 요청URL과 결합하여 처리 (.../"클래스경로"/"메소드경로")
public class HomeController {

	private MemberInsertService memberInsertService;

	@Autowired(required = false)
	public void setMemberInsertService(MemberInsertService memberInsertService) {
		this.memberInsertService = memberInsertService;
	}

	HomeController() {
	}

	@GetMapping("/test.do")
	public String home(Model model) {
		return "home";
	}

	@GetMapping("/test2.do")
	// 기본적으로 사용자의 쿼리스트링으로 넘어오는 파라미터와 컨트롤러 요청 함수의 매개변수를 똑같은 이름으로하여 매핑
	// 파라미터와 매개변수 이름을 다르게 하고싶으면 매개변수 앞에 @RequestParam으로 파라미터값 입력
	public String test2(Model model, String name, String id, @RequestParam("id") String member_id) {
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		model.addAttribute("member_id", member_id);
		return "home2";
	}

	@GetMapping("/test3/{product_id}") // {}경로변수
	// 사용자의 요청 경로정보를 통해 동적으로 값을 전달할 경우 경로정보를 경로변수로 정의,
	// 메소드에서 @PathVarial("경로변수명")을 매개변수 앞에 붙이기
	public String test2(@PathVariable("product_id") String product_id, Model model) {
		model.addAttribute("product_id", product_id);
		return "home3";
	}

	@GetMapping("{product_id}/{country_id}/test4.do")
	public String test3(@PathVariable("country_id") String country_id, @PathVariable("product_id") String product_id,
			Model model) {
		model.addAttribute("product_id", product_id);
		model.addAttribute("country_id", country_id);
		return "home4";
	}

	@PostMapping("test5.do") // 폼의 파라미터를 하나하나씩 받는 대신에 클래스를 만들어서 통째로 받기
	// MemberVo = 커맨드 객체 - 폼 전송 파라미터값을 저장, 처리하는데 사용됨
	// getter setter 포함하고 있어야하고 input태그의 네임값과 일치하는 값 가지고 있어야함
	public String test3(MemberVo memberVo, Model model) {
		model.addAttribute("member_id", memberVo.getMember_id());
		model.addAttribute("member_pw", memberVo.getMember_pw());
		model.addAttribute("member_name", memberVo.getMember_name());
		model.addAttribute("field_interests", memberVo.getField_interests());
		model.addAttribute("memberVo", memberVo);
		return "home5";
	}

	@GetMapping("/ajax.do")
	public String ajax(Model model) {
		return "ajax_ex01";
	}

	@GetMapping("/ajax2.do")
	public String ajax2(Model model) {
		return "ajax_ex02";
	}

	@GetMapping("/ajax3.do")
	public String ajax3(Model model) {
		return "ajax_ex03";
	}

	@GetMapping("/ajax4.do")
	public String ajax4(Model model) {
		return "ajax_ex04";
	}

	@GetMapping("/ajax5.do")
	public String ajax5(Model model) {
		return "ajax_ex05";
	}

	@GetMapping("/ajax6.do")
	public String ajax6(Model model) {
		return "ajax_ex06";
	}

	@GetMapping("/ajax7.do")
	public String ajax7(Model model) {
		return "ajax_ex07";
	}

	@GetMapping("/ajax8.do")
	public String ajax8(Model model) {
		return "ajax_ex08";
	}

	@GetMapping("/ajax02_ex01.do")
	public String ajax02_ex01(Model model) {
		return "ajax02_ex01";
	}

	@GetMapping("/ajax02_ex02.do")
	public String ajax02_ex02(Model model) {
		return "ajax02_ex02";
	}

	@GetMapping("/ajax02_ex03.do")
	public String ajax02_ex03(Model model) {
		return "ajax02_ex03";
	}

	@GetMapping("/ajax02_ex04.do")
	public String ajax02_ex04(Model model) {
		return "ajax02_ex04";
	}

	@GetMapping("/db_test.do")
	public String db_test(Model model) {
		return "db_test";
	}

	@GetMapping("/db_test2.do")
	public String db_test2(MemberVo memberVo, Model model) {
		int result = 0; // 0:입력실패
		result = memberInsertService.insert(memberVo);
		if (result == 1) {
			model.addAttribute("result", "입력 성공");
		} else {
			model.addAttribute("result", "입력 실패");
		}
		return "db_test";
	}
}
