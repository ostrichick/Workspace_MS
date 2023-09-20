package ezen.maru.pjt.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.maru.pjt.service.memberinfo.MemberInfoService;
import ezen.maru.pjt.vo.MemberInfoVo;

@Controller
@RequestMapping("/member")
public class MemberInfoController {

	MemberInfoService signupService, signinService, updateService;

	@Autowired(required = false)
	public void setSignupService(@Qualifier("signup") MemberInfoService signupService) {
		this.signupService = signupService;
	}

	@Autowired(required = false)
	public void setSigninService(@Qualifier("signin") MemberInfoService signinService) {
		this.signinService = signinService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("member_update") MemberInfoService updateService) {
		this.updateService = updateService;
	}

	@GetMapping("/signup") // 회원가입 페이지 요청
	public String member_signup() {
		return "member/signup";
	}

	@PostMapping("/signup_process") // 회원가입 처리 요청
	public String signup_process(MemberInfoVo memberInfoVo, Model model, HttpServletRequest req) {
		int result = signupService.signup(memberInfoVo);
		String viewPage = "member/signup";
		if (result == 1) {
			viewPage = "redirect:/";
			userSessionUpdate(memberInfoVo, req);
		}
		return viewPage;
	}

	@GetMapping("/signin") // 로그인 페이지
	public String member_signin(HttpServletRequest req) {
		String referrer = req.getHeader("Referer");
		req.getSession().setAttribute("prevPage", referrer);
		return "member/signin";
	}

	@PostMapping("/signin_process") // 로그인 요청
	public String signin_process(String member_id, String member_pw, HttpServletRequest req) {
		MemberInfoVo memberInfoVoParam = new MemberInfoVo();
		memberInfoVoParam.setMember_id(member_id);
		memberInfoVoParam.setMember_pw(member_pw);
		String viewPage = "member/signin";
		MemberInfoVo memberInfoVo = signinService.signin(memberInfoVoParam);
		if (memberInfoVo != null) {
			userSessionUpdate(memberInfoVo, req);
			viewPage = "redirect:/";
		}
		return viewPage;
	}

	@GetMapping("/signout") // 로그아웃
	public String signout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@GetMapping("/myinfo") // 내 회원정보 페이지
	public String myinfo(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		MemberInfoVo memberInfoVo = updateService.getMember(member_id);
		model.addAttribute("memberInfoVo", memberInfoVo);
		return "member/myinfo";
	}

	@PostMapping("/updateinfo") // 회원정보 수정
	public String update(MemberInfoVo memberInfoVo, HttpServletRequest req, RedirectAttributes redirect) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		memberInfoVo.setMember_idx(member_idx);
		int result = updateService.update(memberInfoVo);
		String viewPage = "redirect:/member/myinfo";
		if (result == 1) {
			redirect.addFlashAttribute("updateResult", "회원정보 수정 성공");
			viewPage = "redirect:/";
			userSessionUpdate(memberInfoVo, req);
		}
		return viewPage;
	}

	@GetMapping("/deleteprocess") // 회원 탈퇴 요청
	public String delete(MemberInfoVo memberInfoVo, HttpServletRequest req, RedirectAttributes redirect) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		memberInfoVo.setMember_idx(member_idx);
		int result = updateService.delete(memberInfoVo);
		String viewPage = "redirect:/member/myinfo";
		if (result == 1) {
			redirect.addFlashAttribute("updateResult", "성공적으로 탈퇴되었습니다");
			viewPage = "redirect:/";
			session.invalidate();
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
