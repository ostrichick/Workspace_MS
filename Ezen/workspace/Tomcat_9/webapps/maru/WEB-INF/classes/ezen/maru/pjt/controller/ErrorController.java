package ezen.maru.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	@GetMapping("/")
	public String error() {
		return "error/error";
	}

	@GetMapping("/error")
	public String errorerror() {
		return "error/error";
	}
}
