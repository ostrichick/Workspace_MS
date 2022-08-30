package ezen.maru.pjt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/index.do")
	public String indexdo() {
		return "index";
	}

	@GetMapping("/about.do")
	public String about() {
		return "about";
	}

	@GetMapping("/blog.do")
	public String blog() {
		return "blog";
	}

	@GetMapping("/blog-detail.do")
	public String blog_detail() {
		return "blog-detail";
	}

	@GetMapping("/contact.do")
	public String contact() {
		return "contact";
	}

	@GetMapping("/home-02.do")
	public String home_02() {
		return "home-02";
	}

	@GetMapping("/home-03.do")
	public String home_03() {
		return "home-03";
	}

	@GetMapping("/product.do")
	public String product() {
		return "product";
	}

	@GetMapping("/product-detail.do")
	public String product_detail() {
		return "product-detail";
	}

	@GetMapping("/shopping-cart.do")
	public String shopping_cart() {
		return " shopping-cart";
	}

	/////////////////////////
	// cozamall controller // 주석 아래부분 참고하여 작성 후 아래 부분은 삭제
	/////////////////////////

	@GetMapping("/home.do")
	public String home() {
		return "home";
	}
}
