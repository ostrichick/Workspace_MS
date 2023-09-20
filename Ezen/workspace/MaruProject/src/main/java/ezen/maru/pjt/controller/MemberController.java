package ezen.maru.pjt.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.maru.pjt.service.member.MemberService;
import ezen.maru.pjt.vo.MemberVo;

@Controller
public class MemberController {

	//////////////
	// MARU end // 주석 아래부분 참고하여 작성 후 아래 부분은 삭제
	//////////////

	MemberService joinService, loginService, updateService;

	@Autowired(required = false)
	public void setJoinService(@Qualifier("join") MemberService joinService) {
		this.joinService = joinService;
	}

	@Autowired(required = false)
	public void setLoginService(@Qualifier("login") MemberService loginService) {
		this.loginService = loginService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("member_update") MemberService updateService) {
		this.updateService = updateService;
	}

	@GetMapping("/member_join.do") // 회원가입 페이지 요청
	public String member_join() {
		// Controller의 요청처리 메소드에서 반환하는 문자열은 view 이름
		return "member/join";// views아래 member폴더 내에 있는 join JSP페이지
	}

	@PostMapping("/join_process.do") // 회원가입 처리 요청
	public String join_process(MemberVo memberVo, Model model) {
		// MemberVo:커맨드 객체 (사용자로부터 전달되는 파라미터들을 받아서 저장하는 자바 객체)

		// Spring MVC에서는 요청에 대한 처리를 Controller에서 바로 하는 것보다
		// Service클래스에서 처리하는 것을 권장함. Service클래스는 일반적으로 인터페이스를 정의하고
		// 해당 인터페이스를 상속하는 클래스로 정의함. 회원관리시스템에 대한 서비스를 전체적으로 묶을 수
		// 있는 MemberService인터페이스를 정의하고 회원가입에 대해 처리하는 클래스는 MemberJoinService로
		// 정의함(관행: MemberJoinService인터페이스 - MemberJoinServiceImpl클래스)
		int result = joinService.join(memberVo);

		String viewPage = "member/join";
		if (result == 1) {// 회원가입 성공
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
		// MyBatis에 입력값을 여러 개의 넣을 경우 컬렉션(Map)이나 객체를 이용함.
		Map<String, String> loginMap = new HashMap<String, String>();
		loginMap.put("member_id", member_id);
		loginMap.put("member_pw", member_pw);

		String viewPage = "member/login";

		MemberVo memberVo = loginService.login(loginMap);
		if (memberVo != null) {// 로그인 성공
			HttpSession session = req.getSession();
			session.setAttribute("member_id", memberVo.getMember_id());
			session.setAttribute("member_grade", memberVo.getMember_grade());
			session.setAttribute("member_idx", memberVo.getMember_idx());
			viewPage = "redirect:/";
		}
		return viewPage;
	}

	@GetMapping("/member_logout.do")
	public String member_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();

		return "redirect:/";
	}

	@GetMapping("/member_info.do")
	public String member_info(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		MemberVo memberVo = updateService.getMember(member_id);

		model.addAttribute("memberVo", memberVo);

		return "member/update";
	}

	@PostMapping("/update_process.do")
	public String update_process(MemberVo memberVo) {

		int result = updateService.update(memberVo);

		String viewPage = "member/update";
		if (result == 1)
			viewPage = "home";

		return viewPage;
	}

}
