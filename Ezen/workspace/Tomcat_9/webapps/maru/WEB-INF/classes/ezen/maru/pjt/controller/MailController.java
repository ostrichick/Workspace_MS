package ezen.maru.pjt.controller;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ezen.maru.pjt.common.MaruInfo;

@Controller
@RequestMapping("/qna")
public class MailController {
  @Autowired
  private JavaMailSender mailSender;
  private static final Logger logger = LoggerFactory.getLogger(MailController.class);

  // ----------------------------메일발송 JSP 로 이동------------------------
  @RequestMapping(value = "/write", method = RequestMethod.GET)
  public void getMailSend(HttpServletRequest req, Model model) {
    HttpSession session = req.getSession();
    String member_email = (String) session.getAttribute("member_email");
    model.addAttribute("member_email", member_email);
    logger.info("메일발송 JSP진입");
  }

  // --------------------------------메일발송-----------------------------
  // mailSend 코드
  @RequestMapping(value = "/send", method = RequestMethod.POST)
  public String mailSend(HttpServletRequest request, String member_email, String content,
      RedirectAttributes redirect) {
    try {
      MimeMessage mimeMessage = mailSender.createMimeMessage();
      MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
      logger.info("Message {}", mimeMessage);
      // test용 메일 내용
      messageHelper.setFrom(member_email);
      messageHelper.setReplyTo(member_email);
      messageHelper.setTo(MaruInfo.ADMIN_EMAIL); // 관리자 이메일
      messageHelper.setSubject("[마루] " + content); // 메일제목
      messageHelper.setText("<h4>보내는 사람 : " + member_email + "</h4><hr>\n\n" + content, true);
      mailSender.send(mimeMessage);
      redirect.addFlashAttribute("mailSendResult", "메일이 성공적으로 발송되었습니다.");
    } catch (Exception e) {
      e.printStackTrace();
    }
    return "redirect:/qna/write";
  }
}