package ezen.spring.controller;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.spring.dao.MemberDao;
import ezen.spring.vo.MemberVo;

@Controller
public class MemberController {

	private MemberDao memberDao;

	@Autowired(required = false)
	public MemberController(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@GetMapping("/member_index.do")
	public String member_index() {
		return "/member/index";
	}

	@GetMapping("/connection_test.do")
	public String connection_test(Model model) {
		String result = memberDao.connectionTest();
		model.addAttribute("result", result);
		return "/member/result_connection";
	}

	@GetMapping("/member_join.do")
	public String member_join() {
		return "/member/join";
	}

	@PostMapping("/member_joinProcess.do") // post로 받아온게 memberVo가 됨?
	public String member_joinProcess(MemberVo memberVo, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		int result = 0;
		try {
			result = memberDao.join(memberVo);

		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result == 1) {
			model.addAttribute("joinResult", "가입에 성공했습니다. 로그인 해 주세요");
		} else {
			model.addAttribute("joinResult", "가입 도중 오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "/member/index";
	}

//	@PostMapping("/member_loginProcess.do")
//	public String member_loginProcess(String member_id, String member_pw, HttpServletRequest request, Model model) {
//		int result = 0;
//		try {
//			result = memberDao.loginProcess(member_id, member_pw);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//		if (result == 1) {
//			HttpSession session = request.getSession();
//			session.setAttribute("member_id", member_id);
////			session.setAttribute("member_name", member_name);
//			model.addAttribute("loginResult", "로그인에 성공했습니다." + member_id + "님, 환영합니다");
//		} else {
//			model.addAttribute("loginResult", "로그인 도중 오류가 발생했습니다. 다시 시도해주세요.");
//		}
//		return "/member/index";
//	}
	@PostMapping("/member_loginProcess.do")
	public String member_loginProcess(String member_id, String member_pw, HttpServletRequest request, Model model) {
		Map<String, String> resultMap = memberDao.loginProcess(member_id, member_pw);
		if (resultMap != null) {
			HttpSession session = request.getSession();
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_name", resultMap.get("member_name"));
			session.setAttribute("member_grade", resultMap.get("member_grade"));
			model.addAttribute("loginResult", "로그인에 성공했습니다." + member_id + "님, 환영합니다");
		} else {
			model.addAttribute("loginResult", "로그인 도중 오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "/member/index";
	}

	@GetMapping("/member_login.do")
	public String member_login() {
		return "/member/login";
	}

	@GetMapping("/member_logout.do")
	public String member_logout(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.invalidate();
		model.addAttribute("logoutResult", "성공적으로 로그아웃 했습니다");
		return "/member/index";
	}

	@GetMapping("/member_mypage.do")
	public String member_mypage(HttpServletRequest request, Model model, MemberVo memberVo) throws SQLException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		MemberVo memberVoMyPage = memberDao.myPage(member_id);
		model.addAttribute("member_idx", memberVoMyPage.getMember_idx());
		model.addAttribute("member_id", memberVoMyPage.getMember_id());
		model.addAttribute("member_name", memberVoMyPage.getMember_name());
		model.addAttribute("member_handphone", memberVoMyPage.getMember_handphone());
		model.addAttribute("member_grade", memberVoMyPage.getMember_grade());
		model.addAttribute("member_gender", memberVoMyPage.getMember_gender());
		return "/member/mypage";
	}

	@PostMapping("/member_edit.do")
	public String member_edit(String member_pw, HttpServletRequest request, Model model, MemberVo memberVo)
			throws SQLException {
		System.out.println(member_pw + " 컨트롤러");
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		System.out.println("Controller : " + member_id + " , " + member_pw);
		MemberVo memberVoMyPage = memberDao.edit(member_id, member_pw);
		System.out.println(memberVoMyPage);
		System.out.println(memberVoMyPage.getMember_name());
		if (memberVoMyPage.getMember_name() != null) {
			model.addAttribute("member_idx", memberVoMyPage.getMember_idx());
			model.addAttribute("member_id", memberVoMyPage.getMember_id());
			model.addAttribute("member_name", memberVoMyPage.getMember_name());
			model.addAttribute("member_handphone", memberVoMyPage.getMember_handphone());
			model.addAttribute("member_grade", memberVoMyPage.getMember_grade());
			model.addAttribute("member_gender", memberVoMyPage.getMember_gender());
		} else {
			model.addAttribute("editResult", "비밀번호가 다릅니다.");
			return "/member/mypage";
		}
		return "/member/edit";
	}
}
