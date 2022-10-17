package ezen.maru.pjt.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class MyAdvice {

  private Logger logger = LoggerFactory.getLogger(MyAdvice.class);

  @ExceptionHandler(Exception.class)
  public String handleException(Exception ex, Model model) {
    logger.error("Exception 발생 : {}", ex.getMessage());
    System.out.println("핸들익셉션 에러");
    model.addAttribute("msg", "잠시 후 다시 시도해주세요");
    return "error/error";
  }

  @ExceptionHandler(NoHandlerFoundException.class)
  @ResponseStatus(value = HttpStatus.NOT_FOUND)
  public String handle404(NoHandlerFoundException ex, Model model) {
    logger.error("404 요청 발생", ex.getRequestURL());
    System.out.println("404 에러");
    model.addAttribute("msg", "존재하지 않는 페이지입니다.");
    return "error/error";
  }
}