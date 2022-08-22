package ezen.dev.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.dev.spring.service.MemberService;
import ezen.dev.spring.vo.MemberVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	// 작업 순서
	// jsp 작업
	// -> 컨트롤러 매핑
	// -> 서비스 인터페이스 & 디폴트 메소드생성
	// -> 인터페이스 상속받는 구현클래스, 메소드생성
	// -> Dao클래스로 보내서 sql문 처리
	// -> mapper.xml에 sql문 입력

	private MemberService listService, updateGradeService;

	@Autowired(required = false) // setters (set메소드)를 통한 의존주입
	public void setUpdateGradeService(@Qualifier("m_update_grade") MemberService updateGradeService) {
		this.updateGradeService = updateGradeService;
	}

	@Autowired(required = false) // setters (set메소드)를 통한 의존주입
	public void setListService(@Qualifier("m_list") MemberService listService) {
		this.listService = listService;
	}

	@GetMapping("/index.do")
	public String admin_index() {
		return "admin/index";
	}

	@GetMapping("/memberList.do")
	public String memberList(Model model) {
		List<MemberVo> memberList = listService.getMemberList();
		model.addAttribute("memberList", memberList);
		return "admin/memberList";
	}

	@PostMapping("/delete_member.do")
	public String delete_member(@RequestParam("member_idx_arr[]") List<String> member_idx_arr) {

		return null;
	}

	@PostMapping("/update_grade.do")
	@ResponseBody
	public int update_grade(MemberVo memberVo) {
		int result = 0;
		result = updateGradeService.updateGrade(memberVo);
		int returnMemberGrade = 0;
		if (result == 1) {
			returnMemberGrade = memberVo.getMember_grade();
		}
		return returnMemberGrade;
	}
}