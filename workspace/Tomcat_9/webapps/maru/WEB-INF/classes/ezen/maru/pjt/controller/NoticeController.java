package ezen.maru.pjt.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.maru.pjt.common.PagingUtil;
import ezen.maru.pjt.service.board.BoardService;
import ezen.maru.pjt.vo.BoardVo;

@Controller
@RequestMapping("/notice")
// 회원들이 조회하고 관리자가 작성, 수정, 삭제 할 수 있는 공지사항 게시판 컨트롤러
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
	public String notice(PagingUtil pagingUtil, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "perPage", required = false) String perPage) {
		int total = listService.countBoard();
		if (nowPage == null && perPage == null) {
			nowPage = "1";
			perPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (perPage == null) {
			perPage = "10";
		}
		pagingUtil = new PagingUtil(total, Integer.parseInt(nowPage), Integer.parseInt(perPage));
		List<BoardVo> noticeList = listService.getNoticeList(pagingUtil);
		model.addAttribute("paging", pagingUtil);
		model.addAttribute("noticeList", noticeList);
		return "notice/list";
	}

	@GetMapping("/write")
	public String write() {
		return "notice/write";
	}

	@PostMapping("/write_process")
	public String write_process(BoardVo boardVo, RedirectAttributes redirect) {
		int result = insertService.noticeWriteProcess(boardVo);
		String viewPage = "redirect:/notice/write";
		if (result == 1) {
//			PagingUtil pagingUtil = new PagingUtil();
//			List<BoardVo> noticeList = listService.getNoticeList(pagingUtil);
//			redirect.addFlashAttribute("noticeList", noticeList);
			viewPage = "redirect:/notice/view?idx=" + boardVo.getIdx();
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
	public String edit_process(BoardVo boardVo, RedirectAttributes redirect) {
		int result = updateService.noticeEditProcess(boardVo);
		int idx = boardVo.getIdx();
		String viewPage = "redirect:/notice/list";
		System.out.println("result: " + result);
		if (result == 1) {
//			PagingUtil pagingUtil = new PagingUtil();
//			List<BoardVo> noticeList = listService.getNoticeList(pagingUtil);
//			redirect.addFlashAttribute("noticeList", noticeList);
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
//			List<BoardVo> noticeList = listService.getNoticeList();
//			redirect.addFlashAttribute("noticeList", noticeList);
			viewPage = "redirect:/notice/list";
		}
		return viewPage;
	}
}
