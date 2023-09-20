package ezen.spring.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import ezen.spring.vo.Goods;
import ezen.spring.vo.Product;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private Product product;
	private Goods goods1, goods2, goods3;
	private List<Goods> goodsList;

	@Autowired(required = false)
	public void setGoodsList(List<Goods> goodsList) {
		goodsList.clear();
		this.goodsList = goodsList;
	}

	@Autowired(required = false)
	public void setGoods1(Goods goods1) {
		this.goods1 = goods1;
	}

	@Autowired(required = false)
	public void setGoods2(Goods goods2) {
		this.goods2 = goods2;
	}

	@Autowired(required = false)
	public void setGoods3(Goods goods3) {
		this.goods3 = goods3;
	}

	// 자동 의존 주입 : setter메소드 이용
	@Autowired(required = false)
	public void setProduct(Product product) {
		this.product = product;
	}

	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "/", method = RequestMethod.GET) // 스프링3 이하 구버전 매핑방식
	@GetMapping("/") // 스프링4이후부터 가능한 요청처리 애노테이션
	public String home(Locale locale, Model model) {
		// Model 객체는 Spring MVC에서 기본적으로 제공해주는 객체
		// 속성으로 결과값을 담아서 View JSP페이지에서 사용할수 있도록 해줌

//		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY.MM.DD a HH:mm:ss");
		String formattedDate = sdf.format(date);
		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	@GetMapping("/built_in_object.do")
	public String built_in_object(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 후 회원정보를 session객체에 저장하는 경우
		// request 객체를 얻어야 함 (메소드 매개변수로 정의하면 지원)
		HttpSession session = request.getSession();
		session.setAttribute("member_id", "hong@naver.com");

		// 장바구니에 담긴 제품번호를 쿠키로 저장한 경우
		Cookie cookie = new Cookie("CART01", "P0001");
		cookie.setMaxAge(60 * 10);
		// 쿠키를 웹브라우저로 보내기 위해서는 response 객체가 필요함
		// 메소드 매개변수로 Spring에서 지원
		response.addCookie(cookie);

		// Product클래스에 값을 세팅해서 request객체에 저장한 후
		product.setName("컴퓨터");
		product.setPrice(1000000);
		request.setAttribute("product", product);

		return "/built_in_object/use_object";

	}

	@PostMapping("/send_survey.do") // method가 get이 아니라 post로 받을거면 postmapping
	public String send_survey() {
		return "/built_in_object/send_survey";
	}

	@GetMapping("/java_bean.do")
	public String java_bean() {
		return "/java_bean/use_bean";
	}

	@GetMapping("/el_operation.do")
	public String el_operation(Model model) {
		model.addAttribute("num1", 100);
		model.addAttribute("num2", 200);
		return "/el_operation/use_operation";
	}

	@GetMapping("/java_method.do")
	public String java_method() {
		return "/java_method/use_java_method";
	}

	@GetMapping("/java_collection.do")
	public String java_collection(Model model) {
		// 배열 생성 및 모델에 속성으로 추가
		String[] winners = { "홍길동", "심각갓0", "임꺽정" };
		model.addAttribute("winners", winners);

		// 문자열 값을 저장하는 List객체 생성 및 모델에 속성으로 추가
		List<String> items = new ArrayList<String>();
		items.add("딸기");
		items.add("수박");
		items.add("참외");
		items.add("사과");
		model.addAttribute("items", items);

		// 문자열 값을 저장하는 Map객체 생성 및 모델에 속성으로 추가
		Map<String, String> addressBook = new HashMap<String, String>();
		addressBook.put("전주시청", "전라북도 전주시 완산구");
		addressBook.put("독도", "울릉도 동남쪽 뱃길따라 이백리");
		addressBook.put("청와대", "서울특별시 종로구 청와대로 1");
		addressBook.put("에버랜드", "경기도 용인시 처인구");
		model.addAttribute("addressBook", addressBook);

		return "/java_collection/use_java_collection";
	}

	@GetMapping("/jsp_jstl.do")
	public String jsp_jstl() {
		return "/jsp_jstl/jsp_jstl";
	}

	@GetMapping("/jstl_core_selection.do")
	public String jstl_core_selection(Model model) {
		model.addAttribute("num1", 1000);
		model.addAttribute("num2", 500);
		return "/jsp_jstl/use_core_selection";
	}

	@GetMapping("/jstl_core_loop.do")
	public String jstl_core_loop(Model model) {
		// 상품클래스를 Goods클래스로 정의해서
		// 멤버변수(code, price)를 3개씩 값 입력
		// List<Goods>에 저장

		goodsList.clear();
		goods1.setCode("G0001");
		goods1.setPrice(1000);
		goods2.setCode("G0002");
		goods2.setPrice(2000);
		goods3.setCode("G0003");
		goods3.setPrice(3000);

		goodsList.add(goods1);
		goodsList.add(goods2);
		goodsList.add(goods3);

		model.addAttribute("goodsList", goodsList);

		return "/jsp_jstl/use_core_loop";
	}

	@GetMapping("/jstl_core_etc.do")
	public String jstl_core_etc() {
		return "/jsp_jstl/use_core_etc";
	}

	@GetMapping("/jstl_function.do")
	public String jstl_function() {
		return "/jsp_jstl/use_function";
	}

	@GetMapping("/jstl_practice.do")
	public String jstl_practice() {
		return "/jsp_jstl/jstl_practice";
	}

}
