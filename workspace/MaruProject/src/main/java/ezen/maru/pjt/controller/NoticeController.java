package ezen.maru.pjt.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.maru.pjt.service.board.BoardService;
import ezen.maru.pjt.vo.BoardVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {

	BoardService insertService, listService;

	@Autowired(required = false)
	public void setInsertService(@Qualifier("b_insert") BoardService insertService) {
		this.insertService = insertService;
	}

	@Autowired(required = false)
	public void setListService(@Qualifier("b_list") BoardService listService) {
		this.listService = listService;
	}

	@GetMapping("/list.do")
	public String notice(Model model) {
		List<BoardVo> noticeList = listService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "notice/list";
	}

	@GetMapping("/write.do")
	public String write() {
		return "notice/write";
	}

	@PostMapping("/write_process.do")
	public String write_process(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest req,
			RedirectAttributes redirect) {
		int result = insertService.noticeWriteProcess(boardVo, uploadFile, req);
		String viewPage = "redirect:/notice/write.do";
		if (result == 1) {
			List<BoardVo> noticeList = listService.getNoticeList();
			redirect.addFlashAttribute("noticeList", noticeList);
			viewPage = "redirect:/notice/list.do";
		}
		return viewPage;
	}

	@GetMapping("/view")
	public String view(Model model, int idx) {
//		Optional<Object> optional_idx = Optional.ofNullable(idx);
//		System.out.println(idx);
//		int announce_idx = (Integer) optional_idx.get();
//		System.out.println(announce_idx);
//		BoardVo boardVo = listService.getNotice(announce_idx);
		System.out.println(idx + 10000);

		BoardVo boardVo = listService.getNotice(idx);
		model.addAttribute("boardVo", boardVo);
		return "notice/view";
	}
}
