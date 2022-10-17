package ezen.maru.pjt.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.maru.pjt.service.qna.QnaService;
import ezen.maru.pjt.vo.QnaVo;

@Controller
@RequestMapping("/product/qna")
// 공지사항 게시판의 코멘트 기능 컨트롤러
public class QnaController {

  QnaService insertService, listService, updateService, deleteService;

  @Autowired(required = false)
  public void setInsertService(@Qualifier("q_insert") QnaService insertService) {
    this.insertService = insertService;
  }

  @Autowired(required = false)
  public void setListService(@Qualifier("q_list") QnaService listService) {
    this.listService = listService;
  }

  @Autowired(required = false)
  public void setUpdateService(@Qualifier("q_update") QnaService updateService) {
    this.updateService = updateService;
  }

  @Autowired(required = false)
  public void setDeleteService(@Qualifier("q_delete") QnaService deleteService) {
    this.deleteService = deleteService;
  }

  @GetMapping("/list")
  @ResponseBody
  public List<QnaVo> getQnaList(QnaVo qnaVo) {
    List<QnaVo> qnaList = listService.getQnaList(qnaVo);
    return qnaList;
  }

  @GetMapping("/listAnswer")
  @ResponseBody
  public List<QnaVo> getAnswerList(QnaVo qnaVo) {
    List<QnaVo> qnaList = listService.getAnswerList(qnaVo);
    return qnaList;
  }

  @PostMapping("/write")
  @ResponseBody
  public void writeQna(HttpServletRequest req, QnaVo qnaVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    qnaVo.setMember_idx(member_idx);
    insertService.writeQna(qnaVo);
  }

  @PostMapping("/writeAnswer")
  @ResponseBody
  public void writeAnswer(HttpServletRequest req, QnaVo qnaVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    qnaVo.setMember_idx(member_idx);
    insertService.writeAnswer(qnaVo);
  }

  @PostMapping("/edit")
  @ResponseBody
  public void editQna(HttpServletRequest req, QnaVo qnaVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    qnaVo.setMember_idx(member_idx);
    updateService.editQna(qnaVo);
  }

  @PostMapping("/remove")
  @ResponseBody
  public void removeQna(HttpServletRequest req, QnaVo qnaVo) {
    HttpSession session = req.getSession();
//    System.out.println("qnaVo in Controller : " + qnaVo);
    Optional<Object> optional_member_id = Optional.ofNullable(session.getAttribute("member_id"));
    String member_id = (String) optional_member_id.get();
    qnaVo.setMember_id(member_id);
    deleteService.removeQna(qnaVo);
  }
}
