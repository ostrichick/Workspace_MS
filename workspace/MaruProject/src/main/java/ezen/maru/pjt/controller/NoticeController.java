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

	BoardService insertService, listService, updateService, deleteService;

	@Autowired(required = false)
	public void setInsertService(@Qualifier("b_insert") BoardService insertService) {
		this.insertService = insertService;
	}

	@Autowired(required = false)
	public void setListService(@Qualifier("b_list") BoardService listService) {
		this.listService = listService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("b_update") BoardService updateService) {
		this.updateService = updateService;
	}

	@Autowired(required = false)
	public void setDeleteService(@Qualifier("b_delete") BoardService deleteService) {
		this.deleteService = deleteService;
	}

	@GetMapping("/list")
	public String notice(Model model) {
		List<BoardVo> noticeList = listService.getNoticeList();
		model.addAttribute("noticeList", noticeList);
		return "notice/list";
	}

	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}

	@PostMapping("/write_process")
	public String write_process(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest req,
			RedirectAttributes redirect) {
		int result = insertService.noticeWriteProcess(boardVo, uploadFile, req);
		String viewPage = "redirect:/notice/write";
		if (result == 1) {
			List<BoardVo> noticeList = listService.getNoticeList();
			redirect.addFlashAttribute("noticeList", noticeList);
			viewPage = "redirect:/notice/list";
		}
		return viewPage;
	}

	@GetMapping("/view")
	public String view(Model model, int idx) {
		BoardVo boardVo = listService.getNotice(idx);
		model.addAttribute("boardVo", boardVo);
		return "notice/view";
	}

	@GetMapping("/edit")
	public String edit(Model model, int idx) {
		BoardVo boardVo = listService.getNotice(idx);
		model.addAttribute("boardVo", boardVo);
		return "notice/edit";
	}

	@PostMapping("/edit_process")
	public String edit_process(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest req,
			RedirectAttributes redirect) {
		System.out.println(boardVo.getIdx());
		System.out.println(boardVo.getTitle());
		System.out.println(boardVo.getContent());
		int result = updateService.noticeEditProcess(boardVo, uploadFile, req);
		int idx = boardVo.getIdx();
		String viewPage = "redirect:/notice/list";
		System.out.println("result: " + result);
		if (result == 1) {
			List<BoardVo> noticeList = listService.getNoticeList();
			redirect.addFlashAttribute("noticeList", noticeList);
			viewPage = "redirect:/notice/view?idx=" + idx;
		}
		return viewPage;
	}

	@GetMapping("/delete")
	public String delete(Model model, int idx, RedirectAttributes redirect) {
		int result = deleteService.deleteNotice(idx);
		String viewPage = "/notice/list?idx=" + idx;
		if (result == 1) {
			redirect.addFlashAttribute("deleteResult", "성공적으로 삭제되었습니다");
			List<BoardVo> noticeList = listService.getNoticeList();
			redirect.addFlashAttribute("noticeList", noticeList);
			viewPage = "redirect:/notice/list";
		}
		return viewPage;
	}
}
