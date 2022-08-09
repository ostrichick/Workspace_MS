package ezen.spring.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
//		System.out.println(resultMap.isEmpty());
//		System.out.println(resultMap != null);
		if (resultMap != null) {
			HttpSession session = request.getSession();
//			System.out.println(resultMap.isEmpty());
			session.setAttribute("member_id", member_id);
			session.setAttribute("member_name", resultMap.get("member_name"));
			session.setAttribute("member_grade", resultMap.get("member_grade"));
//			System.out.println(resultMap.get("member_name"));
//			System.out.println(session.getAttribute("member_name"));
//			System.out.println(session.getAttribute("member_grade"));
			model.addAttribute("loginResult",
					"로그인에 성공했습니다." + member_id + "님, 환영합니다. 회원등급은 " + session.getAttribute("member_grade") + " 입니다.");
		} else {
			model.addAttribute("loginResult", "로그인에 실패했습니다. 다시 시도해주세요.");
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
	public String member_edit(String member_pw, HttpServletRequest request, HttpServletResponse response, Model model,
			MemberVo memberVo) throws SQLException, IOException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		MemberVo memberVoMyPage = memberDao.edit(member_id, member_pw);
		if (memberVoMyPage.getMember_name() != null) {
			model.addAttribute("member_idx", memberVoMyPage.getMember_idx());
			model.addAttribute("member_id", memberVoMyPage.getMember_id());
			model.addAttribute("member_name", memberVoMyPage.getMember_name());
			model.addAttribute("member_handphone", memberVoMyPage.getMember_handphone());
			model.addAttribute("member_grade", memberVoMyPage.getMember_grade());
			model.addAttribute("member_gender", memberVoMyPage.getMember_gender());
		} else {
			model.addAttribute("editResult", "비밀번호가 다릅니다.");
			response.sendRedirect(request.getContextPath() + "/member_mypage.do");
//			return "/member/mypage";
		}
		return "/member/edit";
	}

	@PostMapping("/member_editProcess.do")
	public String member_editProcess(String member_pw, String member_name, String member_handphone,
			HttpServletRequest request, Model model) throws SQLException {
		HttpSession session = request.getSession();
		String member_id = (String) session.getAttribute("member_id");
		int result = memberDao.editProcess(member_id, member_pw, member_name, member_handphone);
		if (result == 1) {
			model.addAttribute("editResult", "성공적으로 정보가 수정되었습니다.");
		} else {
			model.addAttribute("editResult", "정보를 수정하는데 문제가 발생했습니다.");
		}
		return "/member/index";
	}

	@GetMapping("/member_deactivate.do")
	public String member_deactivate(String member_id, HttpServletRequest request, Model model) throws SQLException {
		HttpSession session = request.getSession();
		String member_id1 = (String) session.getAttribute("member_id");
		int result = memberDao.deactivate(member_id1);
		if (result == 1) {
			model.addAttribute("deactResult", "회원탈퇴에 성공했습니다.");
			session.invalidate();
		} else {
			model.addAttribute("deactResult", "회원탈퇴 과정에 문제가 발생했습니다.");
		}
		return "/member/index";
	}

	@GetMapping("/member_admin.do")
	public String member_admin(String member_grade, HttpServletRequest request, Model model) throws SQLException {
		HttpSession session = request.getSession();
		if ((String) session.getAttribute("member_grade") != "0") {
			ArrayList<MemberVo> mList = memberDao.admin();
			model.addAttribute("adminResult", "관리자 권한으로 접속 완료");
			request.setAttribute("mList", mList);
		} else {
			model.addAttribute("adminResult", "관리자 권한 없음");
			return "/member/index";
		}
		return "/member/admin";
	}

	@PostMapping("/member_delMember.do")
	public void member_editProcess(String member_idx, HttpServletResponse response, HttpServletRequest request,
			Model model) throws SQLException, IOException {
		int result = memberDao.delMember(member_idx);
		if (result == 1) {
			model.addAttribute("delResult", "회원을 성공적으로 삭제했습니다");
			response.sendRedirect(request.getContextPath() + "/member_admin.do");

		} else {
			model.addAttribute("delResult", "회원정보 삭제에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/member_admin.do");
		}
//		return "/member/admin";
	}
}
