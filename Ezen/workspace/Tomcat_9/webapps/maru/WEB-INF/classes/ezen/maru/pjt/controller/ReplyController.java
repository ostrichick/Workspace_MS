package ezen.maru.pjt.controller;

import java.util.ArrayList;
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

import ezen.maru.pjt.service.reply.ReplyService;
import ezen.maru.pjt.vo.ReplyVo;

@Controller
@RequestMapping("/notice/reply")
// 공지사항 게시판의 코멘트 기능 컨트롤러
public class ReplyController {

  ReplyService insertService, listService, updateService, deleteService;

  @Autowired(required = false)
  public void setInsertService(@Qualifier("r_insert") ReplyService insertService) {
    this.insertService = insertService;
  }

  @Autowired(required = false)
  public void setListService(@Qualifier("r_list") ReplyService listService) {
    this.listService = listService;
  }

  @Autowired(required = false)
  public void setUpdateService(@Qualifier("r_update") ReplyService updateService) {
    this.updateService = updateService;
  }

  @Autowired(required = false)
  public void setDeleteService(@Qualifier("r_delete") ReplyService deleteService) {
    this.deleteService = deleteService;
  }

  @GetMapping("/list")
  @ResponseBody
  public List<ReplyVo> getReplyList(ReplyVo replyVo) {
    List<ReplyVo> replyList = new ArrayList<ReplyVo>();
    replyList = listService.getReplyList(replyVo);
    return replyList;
  }

  @PostMapping("/write")
  @ResponseBody
  public void writeReply(HttpServletRequest req, ReplyVo replyVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    replyVo.setMember_idx(member_idx);
    insertService.writeReply(replyVo);
    updateService.countReply(replyVo);
  }

  @PostMapping("/edit")
  @ResponseBody
  public void editReply(HttpServletRequest req, ReplyVo replyVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    replyVo.setMember_idx(member_idx);
    System.out.println(replyVo);
    updateService.editReply(replyVo);
  }

  @PostMapping("/remove")
  @ResponseBody
  public void removeReply(HttpServletRequest req, ReplyVo replyVo) {
    HttpSession session = req.getSession();
//		System.out.println("replyVo in Controller : " + replyVo);
    Optional<Object> optional_member_id = Optional.ofNullable(session.getAttribute("member_id"));
    String member_id = (String) optional_member_id.get();
    replyVo.setMember_id(member_id);
    deleteService.removeReply(replyVo);
    updateService.countReply(replyVo);
  }
}
