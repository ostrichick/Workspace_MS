package ezen.spring.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

	@PostMapping("/member_joinProcess.do")
	public String member_joinProcess(MemberVo memberVo, Model model, HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		try {
			result = memberDao.join(memberVo);
			memberDao.join(memberVo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result == 1) {
			model.addAttribute("joinRresult", "가입에 성공했습니다. 로그인 해 주세요");
		} else {
			model.addAttribute("joinRresult", "가입 도중 오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "/member/index";
	}
	
	@PostMapping("/member_loginProcess.do")
	public String member_loginProcess(String member_id, String member_pw, Model model, HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		try {
			result = memberDao.login(member_id, member_pw);
			memberDao.login(member_id, member_pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (result == 1) {
			model.addAttribute("loginResult", "로그인에 성공했습니다.");
		} else {
			model.addAttribute("loginResult", "로그인 도중 오류가 발생했습니다. 다시 시도해주세요.");
		}
		return "/member/index";
	}

	@GetMapping("/member_login.do")
	public String member_login() {
		return "/member/login";
	}

//	@PostMapping("/join.do") // method가 get이 아니라 post로 받을거면 postmapping
//	public String join_action() {
//		return "/member/join_action";
//	}
}
