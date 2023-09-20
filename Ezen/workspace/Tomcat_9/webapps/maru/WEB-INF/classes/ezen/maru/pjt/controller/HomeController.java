package ezen.maru.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller

public class HomeController {
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("indexHeader", "Y");
		return "index";
	}

	@GetMapping("/index")
	public String indexdo(Model model) {
		model.addAttribute("indexHeader", "Y");
		return "index";
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/error")
	public String error() {
		return "error/error";
	}

	@GetMapping("/product")
	public String product() {
		return "product";
	}

	@GetMapping("/about")
	public String about() {
		return "about";
	}

	@GetMapping("/index2")
	public String index2do() {
		return "index2";
	}

	@GetMapping("/blog")
	public String blog() {
		return "blog";
	}

	@GetMapping("/blog-detail")
	public String blog_detail() {
		return "blog-detail";
	}

	@GetMapping("/review")
	public String review() {
		return "review";
	}

	@GetMapping("/faq")
	public String faq() {
		return "/faq/list";
	}

}
