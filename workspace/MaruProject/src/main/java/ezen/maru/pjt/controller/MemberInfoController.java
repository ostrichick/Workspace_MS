package ezen.maru.pjt.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import ezen.maru.pjt.service.memberinfo.MemberInfoService;
import ezen.maru.pjt.vo.MemberInfoVo;

@Controller
@RequestMapping("/member")
public class MemberInfoController {

	MemberInfoService signupService;

	@Autowired(required = false)
	public void setSignupService(@Qualifier("signup") MemberInfoService signupService) {
		this.signupService = signupService;
	}

	@GetMapping("/signup.do") // 회원가입 페이지 요청
	public String member_signup() {
		// Controller의 요청처리 메소드에서 반환하는 문자열은 view 이름
		return "member/signup";// views아래 member폴더 내에 있는 join JSP페이지
	}

	@PostMapping("/signup_process.do") // 회원가입 처리 요청
	public String signup_process(MemberInfoVo memberInfoVo, Model model, HttpServletRequest req) {
		int result = signupService.signup(memberInfoVo);
		String viewPage = "member/signup.do";
		if (result == 1) {// 회원가입 성공
			viewPage = "redirect:/";
			userSessionUpdate(memberInfoVo, req);
		}
		return viewPage;
	}

	public void userSessionUpdate(MemberInfoVo memberInfoVo, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("member_id", memberInfoVo.getMember_id());
		session.setAttribute("member_name", memberInfoVo.getMember_name());
		session.setAttribute("member_grade", memberInfoVo.getMember_grade());
		session.setAttribute("member_admin", memberInfoVo.getMember_admin());
		session.setAttribute("member_idx", memberInfoVo.getMember_idx());
	}
}
