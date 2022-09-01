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

import ezen.maru.pjt.service.board.BoardService;
import ezen.maru.pjt.vo.BoardVo;

@Controller
@RequestMapping("/board")
public class BoardController {

	//////////////
	// MARU end // 주석 아래부분 참고하여 작성 후 아래 부분은 삭제
	//////////////

	BoardService insertService, listService;

	@Autowired(required = false)
	public void setInsertService(@Qualifier("b_insert") BoardService insertService) {
		this.insertService = insertService;
	}

	@Autowired(required = false)
	public void setListService(@Qualifier("b_list") BoardService listService) {
		this.listService = listService;
	}

	@PostMapping("/board_insert.do")
	public String board_insert(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest request, Model model) {

		int result = insertService.board_insert(boardVo, uploadFile, request);

		String viewPage = "board/board_insert";

		if (result == 1) {// 정상적으로 입력된 경우
			List<BoardVo> boardList = listService.getBoardList();
			model.addAttribute("boardList", boardList);
			viewPage = "board/board_list";
		}
		return viewPage;
	}

	@GetMapping("/board_list.do")
	public String board_list(Model model) {
		List<BoardVo> boardList = listService.getBoardList();
		model.addAttribute("boardList", boardList);

		return "board/board_list";
	}

	@GetMapping("/insert_product.do")
	public String board_write() {

		return "board/board_insert";
	}

}
