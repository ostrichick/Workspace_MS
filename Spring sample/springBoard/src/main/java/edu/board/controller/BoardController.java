package edu.board.controller;

import edu.board.service.BoardService;
import edu.board.vo.BoardVO;
import edu.board.vo.MemberVO;
import edu.board.vo.SearchVO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value = "/board")
@Controller
public class BoardController {

  @Autowired
  private BoardService boardService;

  @RequestMapping(value = "/list.do")
  public String list(Model model, SearchVO searchVO) {
    System.out.println(
      searchVO.getSearchType() + "//" + searchVO.getSearchValue()
    );
    //board 테이블의 전체 데이터 조회 후 포워드

    List<BoardVO> list = boardService.list(searchVO);

    model.addAttribute("list", list);
    model.addAttribute("searchVO", searchVO);

    return "board/list";
  }

  @RequestMapping(value = "/register.do", method = RequestMethod.GET)
  public String register() {
    return "board/register";
  }

  @RequestMapping(value = "/register.do", method = RequestMethod.POST)
  public void register(
    BoardVO vo,
    HttpServletRequest request,
    HttpServletResponse response
  ) throws IOException {
    HttpSession session = request.getSession();

    MemberVO login = (MemberVO) session.getAttribute("login");

    vo.setMidx(login.getMidx());

    //
    int result = boardService.insert(vo);

    response.setContentType("text/html; charset=euc-kr");
    PrintWriter pw = response.getWriter();
    if (result > 0) {
      // 저장 완료
      pw.println(
        "<script>alert('등록이 완료 되었습니다.');location.href='list.do';</script>"
      );
    } else {
      // 저장 안됨
      pw.println(
        "<script>alert('등록이 실패하였습니다.');location.href='list.do';</script>"
      );
    }
    pw.flush();
  }

  @RequestMapping(value = "/view.do")
  public String view(int bidx, Model model) {
    BoardVO vo = boardService.selectOne(bidx);

    model.addAttribute("vo", vo);

    return "board/view";
  }

  @RequestMapping(value = "/modify.do", method = RequestMethod.GET)
  public String modify(Model model, int bidx) {
    //필요시 로그인 체크
    BoardVO vo = boardService.selectOne(bidx);

    model.addAttribute("vo", vo);

    return "board/modify";
  }

  @RequestMapping(value = "/modify.do", method = RequestMethod.POST)
  public String modify(BoardVO vo) {
    boardService.update(vo);

    return "redirect:view.do?bidx=" + vo.getBidx();
  }

  @RequestMapping(value = "delete.do", method = RequestMethod.POST)
  public String delete(int bidx) {
    boardService.delete(bidx);

    return "redirect:list.do";
  }
}
