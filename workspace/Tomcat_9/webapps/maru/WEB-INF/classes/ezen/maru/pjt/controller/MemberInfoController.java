package ezen.maru.pjt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.maru.pjt.service.board.BoardService;
import ezen.maru.pjt.service.certification.CertificationService;
import ezen.maru.pjt.service.memberinfo.MemberInfoService;
import ezen.maru.pjt.service.order.OrderService;
import ezen.maru.pjt.service.qna.QnaService;
import ezen.maru.pjt.service.review.ReviewService;
import ezen.maru.pjt.vo.MemberInfoVo;
import ezen.maru.pjt.vo.OrderVo;
import ezen.maru.pjt.vo.QnaVo;
import ezen.maru.pjt.vo.ReviewVo;

@Controller
@RequestMapping("/member")
// 회원가입, 로그인, 정보수정, 탈퇴 등 회원 관리기능 컨트롤러
public class MemberInfoController {

  MemberInfoService signupService, signinService, updateService, selectService;
  BoardService blistService;
  OrderService olistService;
  ReviewService rvlistService;
  QnaService qlistService;
  CertificationService certificationService;

  @Autowired
  BCryptPasswordEncoder bCryptPasswordEncoder;

  @Autowired(required = false)
  public void setListService2(@Qualifier("b_list") BoardService blistService) {
    this.blistService = blistService;
  }

  @Autowired(required = false)
  public void setOListService2(@Qualifier("o_list") OrderService olistService) {
    this.olistService = olistService;
  }

  @Autowired(required = false)
  public void setRvListService2(@Qualifier("rv_list") ReviewService rvlistService) {
    this.rvlistService = rvlistService;
  }

  @Autowired(required = false)
  public void setQListService2(@Qualifier("q_list") QnaService qlistService) {
    this.qlistService = qlistService;
  }

  @Autowired(required = false)
  public void setSignupService(@Qualifier("signup") MemberInfoService signupService) {
    this.signupService = signupService;
  }

  @Autowired(required = false)
  public void setSigninService(@Qualifier("signin") MemberInfoService signinService) {
    this.signinService = signinService;
  }

  @Autowired(required = false)
  public void setSelectService(@Qualifier("m_select") MemberInfoService selectService) {
    this.selectService = selectService;
  }

  @Autowired(required = false)
  public void setUpdateService(@Qualifier("member_update") MemberInfoService updateService) {
    this.updateService = updateService;
  }

  @Autowired(required = false)
  public void setCertificationService(@Qualifier("cert_sms") CertificationService certificationService) {
    this.certificationService = certificationService;
  }

  @GetMapping("/signup") // 회원가입 페이지 요청
  public String member_signup() {
    return "member/signup";
  }

  @GetMapping("/check/sendSMS") // 무작위 4자리 숫자를 만들어서 전송
  public @ResponseBody String sendSMS(String phoneNumber) {
    Random rand = new Random();
    String numStr = "";
    for (int i = 0; i < 4; i++) {
      String ran = Integer.toString(rand.nextInt(10));
      numStr += ran;
    }

    System.out.println("수신자 번호 : " + phoneNumber);
    System.out.println("인증번호 : " + numStr);
    certificationService.certifiedPhoneNumber(phoneNumber, numStr);
    return numStr;
  }

  @ResponseBody
  @RequestMapping(value = "/check/idDuplicate", method = RequestMethod.POST)
  public int idDuplicateCheck(String member_id) throws Exception {
    int result = selectService.idDuplicateCheck(member_id);
    System.out.println("DuplicateCheck result is : " + result);
    return result;
  }

  @PostMapping("/signup_process") // 회원가입 처리 요청
  public String signup_process(MemberInfoVo memberInfoVo, Model model, HttpServletRequest req) {
    int id_result = selectService.idDuplicateCheck(memberInfoVo.getMember_id());
    System.out.println("id_result : " + id_result);
    String viewPage = "member/signup";
    if (id_result != 1) { // 아이디 중복을 다시 체크하고 중복이 아니면 진행
      String input_member_pw = memberInfoVo.getMember_pw();
      String member_pw = bCryptPasswordEncoder.encode(input_member_pw);
      // form에서 받아온 비밀번호를 암호화해여 vo객체에 저장
      memberInfoVo.setMember_pw(member_pw);
      int result = signupService.signup(memberInfoVo);

      if (result == 1) {
        viewPage = "redirect:/";
        userSessionUpdate(memberInfoVo, req);
      }
    }
    return viewPage;
  }
//////////////////
  // 회원가입 끝
  ////////////////

  @GetMapping("/signin") // 로그인 페이지
  public String signin(HttpServletRequest req) {
    String referrer = req.getHeader("Referer");
    req.getSession().setAttribute("prevPage", referrer);
    return "member/signin";
  }

  @GetMapping("/find") // 아이디 비밀번호 찾기 선택 페이지
  public String find(HttpServletRequest req) {

    return "member/find";
  }

  @PostMapping("/signin_process") // 로그인 요청
  public String signin_process(MemberInfoVo memberInfoVo, HttpServletRequest req) throws Exception {
    String viewPage = "member/signin";

//    System.out.println(bCryptPasswordEncoder.encode("123"));

    MemberInfoVo memberInfoVoFromDB = signinService.getCryptedMemberPw(memberInfoVo);
    boolean pwMatchResult = false;
    if (memberInfoVoFromDB.getMember_pw() != null) {
      String getCryptedMemberPw = memberInfoVoFromDB.getMember_pw();
//			System.out.println(bCryptPasswordEncoder.encode(memberInfoVo.getMember_pw()));
      pwMatchResult = bCryptPasswordEncoder.matches(memberInfoVo.getMember_pw(), getCryptedMemberPw);
//			System.out.println(memberInfoVo.getMember_pw());
//			System.out.println(getCryptedMemberPw);
//			System.out.println(pwMatchResult);
    }
    // 입력받은 값과 암호화된 값을 matches로 비교
    if (pwMatchResult) {
      userSessionUpdate(memberInfoVoFromDB, req);
      viewPage = "redirect:/";
    }
    return viewPage;
  }

  @GetMapping("/signout") // 로그아웃
  public String signout(HttpServletRequest req) {
    HttpSession session = req.getSession();
    session.invalidate();
    return "redirect:/";
  }

  @GetMapping("/myinfo") // 내 회원정보 페이지
  public String myinfo(HttpServletRequest req, Model model) {
    HttpSession session = req.getSession();
    String member_id = (String) session.getAttribute("member_id");
    int member_idx = (int) session.getAttribute("member_idx");
    MemberInfoVo memberInfoVo = updateService.getMember(member_id);
    model.addAttribute("memberInfoVo", memberInfoVo);
    List<OrderVo> orderList = new ArrayList<OrderVo>();
    orderList = olistService.getOrderList(member_idx);
    model.addAttribute("orderList", orderList);
    List<ReviewVo> reviewList = new ArrayList<ReviewVo>();
    reviewList = rvlistService.getReviewListMember(member_idx);
    model.addAttribute("reviewList", reviewList);
    List<QnaVo> qnaList = new ArrayList<QnaVo>();
    qnaList = qlistService.getQnaListMember(member_idx);
    model.addAttribute("qnaList", qnaList);
    // System.out.println(qnaList);
    model.addAttribute("memberStats", "보여주고 싶은 집계를 맵으로 넣을 것");

    return "member/myinfo";
  }

  @ResponseBody
  @RequestMapping(value = "/check/pw", method = RequestMethod.POST)
  public boolean pw(MemberInfoVo memberInfoVo) throws Exception {
    MemberInfoVo memberInfoVoFromDB = signinService.getCryptedMemberPw(memberInfoVo);
    boolean pwMatchResult = false;
    if (memberInfoVoFromDB.getMember_pw() != null) {
      String getCryptedMemberPw = memberInfoVoFromDB.getMember_pw();
      pwMatchResult = bCryptPasswordEncoder.matches(memberInfoVo.getMember_pw(), getCryptedMemberPw);
    }
    System.out.println("Password Check result is : " + pwMatchResult);
    return pwMatchResult;
  }

  @GetMapping("/myinfo_edit") // 내 회원정보 페이지
  public String myinfo_edit(HttpServletRequest req, Model model) {
    HttpSession session = req.getSession();
    String member_id = (String) session.getAttribute("member_id");
    MemberInfoVo memberInfoVo = updateService.getMember(member_id);
    model.addAttribute("memberInfoVo", memberInfoVo);
    return "member/myinfo_edit";
  }

  @PostMapping("/updateinfo") // 회원정보 수정
  public String update(MemberInfoVo memberInfoVo, HttpServletRequest req, RedirectAttributes redirect) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    memberInfoVo.setMember_idx(member_idx);
    String input_member_pw = memberInfoVo.getMember_pw();
    String member_pw = bCryptPasswordEncoder.encode(input_member_pw);

    memberInfoVo.setMember_pw(member_pw);
    int result = updateService.update(memberInfoVo);
    String viewPage = "redirect:/member/myinfo";
    if (result == 1) {
      redirect.addFlashAttribute("updateResult", "회원정보 수정 성공");
      viewPage = "redirect:/";
      userSessionUpdate(memberInfoVo, req);
    }
    return viewPage;
  }

  @GetMapping("/deleteprocess") // 회원 탈퇴 요청
  public String delete(MemberInfoVo memberInfoVo, HttpServletRequest req, RedirectAttributes redirect) {
    HttpSession session = req.getSession();
    Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
    int member_idx = (int) optional_member_idx.get();
    memberInfoVo.setMember_idx(member_idx);
    int result = updateService.delete(memberInfoVo);
    String viewPage = "redirect:/member/myinfo";
    if (result == 1) {
      redirect.addFlashAttribute("updateResult", "성공적으로 탈퇴되었습니다");
      viewPage = "redirect:/";
      session.invalidate();
    }
    return viewPage;
  }

  public void userSessionUpdate(MemberInfoVo memberInfoVo, HttpServletRequest req) {
    HttpSession session = req.getSession();
    session.setAttribute("member_id", memberInfoVo.getMember_id());
    session.setAttribute("member_name", memberInfoVo.getMember_name());
    session.setAttribute("member_email", memberInfoVo.getMember_email());
    session.setAttribute("member_grade", memberInfoVo.getMember_grade());
    session.setAttribute("member_admin", memberInfoVo.getMember_admin());
    session.setAttribute("member_idx", memberInfoVo.getMember_idx());
  }
}
