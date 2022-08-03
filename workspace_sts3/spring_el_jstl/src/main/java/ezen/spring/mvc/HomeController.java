package ezen.spring.mvc;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

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

	@GetMapping("/built_in_object.do") // 스프링4이후부터 가능한 요청처리 애노테이션
	public String built_in_object(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 후 회원정보를 session객체에 저장하는 경우
		// request 객체를 얻어야 함 (메소드 매개변수로 정의하면 지원)
		HttpSession session = request.getSession();
		session.setAttribute("member_id", "hong@naver.com");
		
		//장바구니에 담긴 제품번호를 쿠키로 저장한 경우
		Cookie cookie = new Cookie("CART01", "P0001");
		cookie.setMaxAge(60*10);
		//쿠키를 웹브라우저로 보내기 위해서는 response 객체가 필요함
		//메소드 매개변수로 Spring에서 지원
		response.addCookie(cookie);
		
		return "/built_in_object/use_object";
	}
}
