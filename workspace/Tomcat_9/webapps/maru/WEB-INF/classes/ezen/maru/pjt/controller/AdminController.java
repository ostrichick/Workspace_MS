package ezen.maru.pjt.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.maru.pjt.service.admin.AdminService;
import ezen.maru.pjt.service.memberinfo.MemberInfoService;
import ezen.maru.pjt.service.product.ProductService;
import ezen.maru.pjt.service.qna.QnaService;
import ezen.maru.pjt.vo.MemberInfoVo;
import ezen.maru.pjt.vo.ProductVo;
import ezen.maru.pjt.vo.QnaVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
  ProductService p_listService;
//  BoardService b_listService;
  MemberInfoService m_listService;
  QnaService q_listService;
  AdminService listService;

  @Autowired(required = false)
  public void setPListService(@Qualifier("p_list") ProductService p_listService) {
    this.p_listService = p_listService;
  }

//  @Autowired(required = false)
//  public void setBListService(@Qualifier("b_list") BoardService b_listService) {
//    this.b_listService = b_listService;
//  }

  @Autowired(required = false)
  public void setBListService(@Qualifier("m_list") MemberInfoService m_listService) {
    this.m_listService = m_listService;
  }

  @Autowired(required = false)
  public void setQListService(@Qualifier("q_list") QnaService q_listService) {
    this.q_listService = q_listService;
  }

  @Autowired(required = false)
  public void setListService(@Qualifier("admin_list") AdminService listService) {
    this.listService = listService;
  }

  @GetMapping("/dashboard")
  public String dashboard(@RequestParam(required = false, defaultValue = "%%") String product_major_category,
      Model model) {
    List<ProductVo> productList = p_listService.getProductList(product_major_category);
    List<MemberInfoVo> memberList = m_listService.getMemberInfoList();
    List<QnaVo> qnaList = q_listService.getAllQuestionList();
    Map<String, String> getStats = listService.getStats();

    JSONObject stats = new JSONObject(getStats);

    model.addAttribute("productList", productList);
    model.addAttribute("memberList", memberList);
    model.addAttribute("qnaList", qnaList);
    model.addAttribute("getStats", getStats);
    model.addAttribute("stats", stats);
    return "admin/dashboard";
  }

  @GetMapping("/getStats")
  @ResponseBody
  public Map<String, String> getStats(Model model) {
    Map<String, String> getStats = new HashMap<String, String>();
    getStats = listService.getStats();
    JSONObject stats = new JSONObject(getStats);
    model.addAttribute("stats", stats);
    return getStats;
  }

}
