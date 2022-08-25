package ezen.dev.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.service.board.BoardService;
import ezen.dev.spring.vo.FileVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	BoardService insertService, listService;

	@Autowired(required = false)
	public void setBoardInsertService(@Qualifier("b_insert") BoardService insertService) {
		this.insertService = insertService;
	}

	@Autowired(required = false)
	public void setBoardListService(@Qualifier("b_list") BoardService listService) {
		this.listService = listService;
	}

	@GetMapping("/list.do")
	public String board_list(Model model) {
		List<FileVo> boardList = listService.getBoardList();
		model.addAttribute("boardList", boardList);
		return "board/list";
	}

	@GetMapping("/insert.do")
	public String board_insert() {
		return "board/insert";
	}

	@PostMapping("/insert_process.do")
	public String insert_process(FileVo fileVo, MultipartRequest uploadFile, HttpServletRequest req,
			HttpServletResponse res, Model model) throws IOException {
		HttpSession session = req.getSession();
		String castedMemberId = (String) session.getAttribute("member_id");
		int castedMemberIdx = (int) session.getAttribute("member_idx");
		fileVo.setWriter_id(castedMemberId);
		fileVo.setMember_idx(castedMemberIdx);
		int result = insertService.board_insert(fileVo, uploadFile, req);
		System.out.println("result is = " + result);
		String viewPage = "board/insert";
		if (result == 1) {
			List<FileVo> boardList = listService.getBoardList();
			model.addAttribute("boardList", boardList);
//			res.sendRedirect(${pageContext.request.contextPath}"/board/list.do");
			viewPage = "board/list";
			System.out.println(viewPage);
		}
		System.out.println(viewPage);
		return viewPage;
	}
}
