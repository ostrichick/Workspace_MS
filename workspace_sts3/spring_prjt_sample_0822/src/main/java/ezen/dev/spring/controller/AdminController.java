package ezen.dev.spring.controller;

import java.util.HashMap;
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

	MemberService listService, updateService, deleteService;

	@Autowired(required = false)
	public void setListService(@Qualifier("m_list") MemberService listService) {
		this.listService = listService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("m_update") MemberService updateService) {
		this.updateService = updateService;
	}

	@Autowired(required = false)
	public void setDeleteService(@Qualifier("m_delete") MemberService deleteService) {
		this.deleteService = deleteService;
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

	@PostMapping("/update_grade.do")
//	@ResponseBody //요청에 대한 처리결과를 Ajax통신의 결과로 전달
	public String adminUpdateInfo(@RequestParam("member_idx") int member_idx,
			@RequestParam("member_grade") int member_grade) {

		// 웹브라우저에서 전달받은 2개의 값을 MyBatis의 입력값으로 사용하기 위해 HashMap객체 생성해서 저장
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("member_idx", member_idx);
		map.put("member_grade", member_grade);

		String result = "N";// 정보수정 실패

		int flag = updateService.updateGrade(map);

		if (flag == 1)
			result = "Y";// 정보수정 성공

		return result;
	}

	@PostMapping("/delete_member.do")
	@ResponseBody // 요청에 대한 처리결과를 Ajax통신의 결과로 전달
	public String admin_del_member(@RequestParam("member_idx_arr[]") List<Integer> idx_list) {

		String result = "N";// 회원삭제 실패

		int flag = deleteService.deleteMember(idx_list);

		if (flag != 0)
			result = "Y";// 회원삭제 성공

		return result;
	}

	@GetMapping("/member_updateList.do")
	public String member_updateList(Model model) {

		List<MemberVo> updateList = listService.getUpdateList();
		// 모델객체에 회원목록을 추가함
		model.addAttribute("updateList", updateList);

		return "admin/updateList";
	}

	@GetMapping("/member_deleteList.do")
	public String member_deleteList(Model model) {

		List<MemberVo> deleteList = listService.getDeleteList();
		// 모델객체에 회원목록을 추가함
		model.addAttribute("deleteList", deleteList);

		return "/admin/deleteList";
	}

}
