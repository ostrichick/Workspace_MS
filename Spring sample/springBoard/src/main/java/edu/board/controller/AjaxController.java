package edu.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.board.service.BoardService;
import edu.board.service.MemberService;
import edu.board.vo.BoardVO;
import edu.board.vo.MemberVO;
import edu.board.vo.SearchVO;

@RequestMapping(value="/ajax")
@Controller
public class AjaxController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/home.do")
	public String home() {
		
		return "ajax/home";
	}
	
	@RequestMapping(value="/sample1.do")
	@ResponseBody
	public String sample1() {
		return "sample data";
	}
	
	@RequestMapping(value="/adminInfo.do")
	@ResponseBody
	public MemberVO adminInfo() {
		MemberVO result = memberService.selectAdmin();
		return result;
	}
	
	@RequestMapping(value="/boardPrint.do")
	@ResponseBody
	public List<BoardVO> boardPrint(){
		
		SearchVO searchVO = new SearchVO();
		
		return boardService.list(searchVO);
	}
	
	
}









