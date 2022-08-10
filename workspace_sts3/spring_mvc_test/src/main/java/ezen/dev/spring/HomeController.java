package ezen.dev.spring;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

  @GetMapping("/test.do")
  public String home(Model model) {
    return "home";
  }

  @GetMapping("/test2.do")
  public String test2(Model model, String name, String id) {
    model.addAttribute("name", name);
    model.addAttribute("id", id);
    return "home2";
  }
}
