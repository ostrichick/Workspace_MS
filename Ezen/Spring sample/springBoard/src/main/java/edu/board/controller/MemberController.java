package edu.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.board.service.MemberService;
import edu.board.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		
		return "member/join";
	}
	
	@RequestMapping(value="/join.do", method=RequestMethod.POST)
	public String join(MemberVO vo) {
		
		memberService.regMember(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
		
		return "member/login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(MemberVO vo,HttpServletRequest request) {
		
		MemberVO member = memberService.selectOne(vo);
		
		if(member != null) {
			//로그인 처리 
			
			HttpSession session = request.getSession(true);
			
			MemberVO login = new MemberVO();
			login.setMidx(member.getMidx());
			login.setMid(member.getMid());
			
			session.setAttribute("login", login); //로그인 처리
			
			
//			session.setAttribute("mid", member.getMid());
//			session.setAttribute("midx", member.getMidx());
			
			return "redirect:/";
		}else {
			//로그인 실패 처리
			
			return "redirect:/login.do";
		}
		
	}
	
	@RequestMapping(value="logout.do")
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="mypage.do")
	public String mypage(Model model, HttpServletRequest request) {
		
		//로그인 정보를 이용하여 로그인 회원 정보 조회
		
		HttpSession session = request.getSession(); //시스템 session 정보 가져옴
		
		MemberVO login = (MemberVO)session.getAttribute("login"); // session에 있는 로그인 유저 정보
		
		MemberVO member = memberService.selectOne(login); // 로그인 유저 정보를 사용하여 부가 정보 가져옴
		
		model.addAttribute("member",member);	//웹 페이지로 로그인한 유저의 전체 정보를 보냄
		
		
		return "member/mypage";
	}
	
	@RequestMapping(value="/member/list.do", method=RequestMethod.GET)
	public String list(Model model) {
		
		List<MemberVO> list = memberService.list();
		
		model.addAttribute("list", list);
		
		return "member/list";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.GET)
	public String modify(HttpServletRequest request,HttpServletResponse response
			,Model model) throws IOException {
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		
		if(login == null) {
			response.setContentType("text/html; charset=euc-kr;");
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('로그인 후 이용하세요.');location.href='login.do'</script>");
			pw.flush();
		}
		
		MemberVO vo = memberService.selectOne(login);
		
		model.addAttribute("vo",vo);
		
		return "member/modify";
	}
	
	@RequestMapping(value="modify.do", method=RequestMethod.POST)
	public String modify(MemberVO vo,HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO)session.getAttribute("login");
		
		vo.setMidx(login.getMidx());
		
		//DB에 수정처리
		
		int result = memberService.update(vo);
		
		if(result>0) {
			return "redirect:mypage.do";
		}else {
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value="delete.do")
	public void delete(HttpServletRequest request,HttpServletResponse response)
			throws IOException {
		
		HttpSession session =request.getSession();
		MemberVO login =(MemberVO)session.getAttribute("login");
		
		int midx = login.getMidx();
		
		int result = memberService.delYN(midx);
		
		
		response.setContentType("text/html; charset=euc-kr;");
		PrintWriter pw = response.getWriter();
		
		if(result>0) {
			pw.println("<script>alert('탈퇴가 정상적으로 처리 되었습니다.');location.href='"+request.getContextPath()+"';</script>");
		}else {
			pw.println("<script>alert('탈퇴 완료 되지 않았습니다..');location.href='"+request.getContextPath()+"';</script>");
		}
		
		pw.flush();
		
		
	}
	
	
}












