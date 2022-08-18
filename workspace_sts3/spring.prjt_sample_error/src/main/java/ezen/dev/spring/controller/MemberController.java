package ezen.dev.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.vo.MemberVo;

@Controller
//@RequestMapping("/home")
public class MemberController {

	MemberService joinService;

	@Autowired(required = false)
	public void setJoinService(@Qualifier("join") MemberService joinService) {
		// @Qualifier 를 통해 어떤 서비스를 사용할 것인지 명시
		this.joinService = joinService;
		// set메소드를 사용한 의존 자동 주입용
	}

	@GetMapping("/member_join.do")
	public String member_join() {
		return "member/join";
	}

	@PostMapping("/join_process.do")
	public String join_process(MemberVo memberVo, Model model) {
		int result = joinService.join(memberVo);

		if (result == 1) {
			model.addAttribute("result", "정상적으로 회원가입이 되었습니다");
		} else {
			model.addAttribute("result", "회원가입 실패");
		}
		return "member/join_result";
	}

	@GetMapping("/") // 사용자의 요청정보를 처리하는 요청처리 메소드 정의
	public String test() {
		return "home";// 요청 처리결과를 가지고 화면을 구성하는 View 페이지 이름을 DispatcherServlet으로 반환함
	}
}
