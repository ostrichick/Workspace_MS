package edu.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.board.service.BoardService;
import edu.board.vo.BoardVO;
import edu.board.vo.SearchVO;

@Controller
@RequestMapping(value="/ajax2")
public class Ajax2Controller {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/home")
	public String home(Model model) {
		
		List<BoardVO> list = boardService.list(new SearchVO());
		
		model.addAttribute("list",list);
		
		return "ajax2/home";
	}
	
	@RequestMapping(value="detail.do")
	@ResponseBody
	public BoardVO detail(int bidx) {
		
		return boardService.selectOne(bidx);
	}
	
	@RequestMapping(value="modify.do")
	@ResponseBody
	public BoardVO modify(BoardVO vo) {
		
		boardService.update(vo);
		
		return boardService.selectOne(vo.getBidx());
	}
}








