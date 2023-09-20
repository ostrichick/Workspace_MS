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

import ezen.maru.pjt.service.review.ReviewService;
import ezen.maru.pjt.vo.ReviewVo;

@Controller
@RequestMapping("/product/review")
// 공지사항 게시판의 코멘트 기능 컨트롤러
public class ReviewController {

  ReviewService insertService, listService, updateService, deleteService;

  @Autowired(required = false)
  public void setInsertService(@Qualifier("rv_insert") ReviewService insertService) {
    this.insertService = insertService;
  }

  @Autowired(required = false)
  public void setListService(@Qualifier("rv_list") ReviewService listService) {
    this.listService = listService;
  }

  @Autowired(required = false)
  public void setUpdateService(@Qualifier("rv_update") ReviewService updateService) {
    this.updateService = updateService;
  }

  @Autowired(required = false)
  public void setDeleteService(@Qualifier("rv_delete") ReviewService deleteService) {
    this.deleteService = deleteService;
  }

//  @GetMapping("/list")
//  @ResponseBody
//  public List<ReviewVo> getReviewList(ReviewVo reviewVo) {
////		System.out.println("reviewVo in Controller : " + reviewVo);
//    List<ReviewVo> reviewList = listService.getReviewList();
////		System.out.println("reviewList in Controller : " + reviewList);
//    return reviewList;
//  }

  @GetMapping("/listAnswer")
  @ResponseBody
  public List<ReviewVo> getAnswerList(ReviewVo reviewVo) {
//		System.out.println("reviewVo in Controller : " + reviewVo);
    List<ReviewVo> reviewList = listService.getAnswerList(reviewVo);
//		System.out.println("reviewList in Controller : " + reviewList);
    return reviewList;
  }

  @PostMapping("/write")
  @ResponseBody
  public void writeReview(HttpServletRequest req, ReviewVo reviewVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    reviewVo.setMember_idx(member_idx);
    insertService.writeReview(reviewVo);
  }

  @PostMapping("/writeAnswer")
  @ResponseBody
  public void writeAnswer(HttpServletRequest req, ReviewVo reviewVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    reviewVo.setMember_idx(member_idx);
    insertService.writeAnswer(reviewVo);
  }

  @PostMapping("/edit")
  @ResponseBody
  public void editReview(HttpServletRequest req, ReviewVo reviewVo) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    reviewVo.setMember_idx(member_idx);
    System.out.println(reviewVo);
    updateService.editReview(reviewVo);
  }

  @PostMapping("/remove")
  @ResponseBody
  public void removeReview(HttpServletRequest req, ReviewVo reviewVo) {
    // HttpSession session = req.getSession();
//    System.out.println("reviewVo in Controller : " + reviewVo);
    // Optional<Object> optional_member_id =
    // Optional.ofNullable(session.getAttribute("member_id"));
    // String member_id = (String) optional_member_id.get();

    deleteService.removeReview(reviewVo);
  }
}
