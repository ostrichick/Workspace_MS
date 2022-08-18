package ezen.dev.spring.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.vo.MemberVo;

@Controller
public class MemberController {

	MemberService joinService, loginService;

	@Autowired(required = false)
	public void setJoinService(@Qualifier("join") MemberService joinService) {
		this.joinService = joinService;
	}

	@Autowired(required = false)
	public void setLoginService(@Qualifier("login") MemberService loginService) {
		this.loginService = loginService;
	}

	@GetMapping("/member_join.do") // 회원가입 페이지 요청
	public String member_join() {
		// Controller의 요청처리메소드에서 반환하는 문자열 = view 이름
		return "member/join"; // views아래 member 폴더 안의 join.jsp 페이지 경로 반환
	}

	@PostMapping("/join_process.do") // 회원가입 처리 요청
	public String join_process(MemberVo memberVo) {
		// MemberVo: 커맨드 객체(사용자부터 전달되는 파라미터를 받아서 저장하는 자바객체)

		// Spring MVC에서는 요청 처리를 Controller에서 바로 하는 대신 Service 클래스에서 처리하는 것을 권장
		// Service는 일반적으로 인터페이스 정의, 인터페이스 상속 클래스로 정의
		// 회원관리 시스템 전체를 묶을 수 있는 MemberService 인터페이스를 정의하고
		// 처리하는 각각의 과정은 구현 클래스로 정의
		// (관행: MemberJoinService 인터페이스, MemberJoinServiceImpl 클래스)
		int result = joinService.join(memberVo);

		String viewPage = "member/join";
		if (result == 1) {
			viewPage = "redirect:/";
		}
		return viewPage;
	}

	@GetMapping("/member_login.do")
	public String member_login() {
		return "member/login";
	}

	@PostMapping("/login_process.do")
	public String login_process(String member_id, String member_pw, HttpServletRequest req) {
		// MyBatis에 입력값을 여러개 넣을 경우 Map이나 객체 이용
		Map<String, String> loginMap = new HashMap<String, String>();
		loginMap.put("member_id", member_id);
		loginMap.put("member_pw", member_pw);
		MemberVo memberVo = loginService.login(loginMap);

		String viewPage = "member/login";
		if (memberVo != null) {
			HttpSession session = req.getSession();
			session.setAttribute("member_id", memberVo.getMember_id());
			session.setAttribute("member_grade", memberVo.getMember_grade());
			viewPage = "redirect:/";
		}
		return viewPage;
	}
}
