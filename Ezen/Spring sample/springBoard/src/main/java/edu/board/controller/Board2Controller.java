package edu.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.board.service.Board2Service;
import edu.board.vo.BoardVO;

@RequestMapping(value="/board2")
@Controller
public class Board2Controller {

	@Autowired
	private Board2Service board2Service;
	
	@RequestMapping(value="/list.do")
	public String list(Model model) {
		
		List<BoardVO> list = board2Service.selectAll();
		
		model.addAttribute("list", list);
		
		return "board2/list";
	}
}
