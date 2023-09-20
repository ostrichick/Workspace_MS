package ezen.maru.pjt.controller;

import java.util.List;
import java.util.Optional;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import ezen.maru.pjt.service.cart.CartService;
import ezen.maru.pjt.vo.CartVo;

@Controller
@RequestMapping("/cart")
// 회원들이 조회하고 관리자가 업로드, 수정, 삭제할 수 있는 상품 페이지 관련 컨트롤러
public class CartController {
	CartService insertService, listService, updateService, deleteService;

	@Autowired(required = false)
	public void setListService(@Qualifier("c_list") CartService listService) {
		this.listService = listService;
	}

	@Autowired(required = false)
	public void setInsertService(@Qualifier("c_insert") CartService insertService) {
		this.insertService = insertService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("c_update") CartService updateService) {
		this.updateService = updateService;
	}

	@Autowired(required = false)
	public void setDeleteService(@Qualifier("c_delete") CartService deleteService) {
		this.deleteService = deleteService;
	}

	@GetMapping("/")
	public String list(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		List<CartVo> cartList = listService.getCartList(member_idx);
		model.addAttribute("cartList", cartList);
		return "cart";
	}

	@ResponseBody
	@PostMapping("/reloadCart")
	public List<CartVo> reload(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		List<CartVo> cartList = listService.getCartList(member_idx);
		model.addAttribute("cartList", cartList);
		return cartList;
	}

	@GetMapping("/add")
	public String add() {
		return "cart/add";
	}

	@PostMapping("/add_process")
	@ResponseBody
	public String cart_add(HttpServletRequest req, HttpServletResponse res, CartVo cartVo, Model model) {
		String returnValue = "실패";
		HttpSession session = req.getSession();
//		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
//		System.out.println(optional_member_idx);
//		int member_idx = (int) optional_member_idx.get();

		Object member_idx_String = session.getAttribute("member_idx");
		Cookie cookie = WebUtils.getCookie(req, "cartCookie");
		int member_idx = 0;

		if (member_idx_String != null && cookie == null) { // 회원이고 쿠키 없을 경우
			member_idx = (int) member_idx_String; // 세션에서 불러온 member_idx를 인트로 변환, 저장
		} else if (member_idx_String != null && cookie != null) { // 회원이고 쿠키 있을 경우
			// ! TODO ! 쿠키에 저장된 비로그인 장바구니를 회원으로 옮기는 로직 추가할것
			member_idx = (int) member_idx_String;
		} else if (session.getAttribute("member_idx") == null && cookie == null) { // 비회원 장바구니 첫클릭
			Random random = new Random();
			int randomDivide = 1000 + random.nextInt(10000);
			member_idx = (int) (System.currentTimeMillis() / randomDivide);
			// 무작위 난수 생성, 비로그인 유저용 member_idx로 사용
			System.out.println("쿠키용으로 사용할 member_idx : " + member_idx);

			Cookie cookieCart = new Cookie("member_idx", Integer.toString(member_idx));
			cookieCart.setMaxAge(60 * 60 * 24 * 2); // 60초 * 60분 * 24시간 * 2일
			cookieCart.setPath("/");
			res.addCookie(cookieCart);

			Cookie[] cookies = req.getCookies();
			for (Cookie oneCookie : cookies) {
				String cookieKey = oneCookie.getName();
				String cookieValue = oneCookie.getValue();
				System.out.println("cookeyKey : " + cookieKey + " , cookieValue : " + cookieValue);
			}

		}
//		else if (session.getAttribute("member_idx") == null && cookie != null) {
//			// ! TODO ! 비로그인이고 이미 쿠키가 있는 경우, 쿠키에서 member_idx 불러와서 진행
//		}
		cartVo.setMember_idx(member_idx);
		int result = insertService.addCart(cartVo);
		if (result == 1) {// 정상적으로 입력된 경우, 해당 상품 페이지로 이동할 것
			returnValue = "성공";
		}
		return returnValue;
	}

	@PostMapping("/updateCart")
	@ResponseBody
	public String updateCart(HttpServletRequest req, HttpServletResponse res, CartVo cartVo, Model model) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		cartVo.setMember_idx(member_idx);
		int result = updateService.updateCart(cartVo);
		String viewPage = "";
		if (result == 1) {// 정상적으로 입력된 경우, 해당 상품 페이지로 이동할 것
			viewPage = "redirect:/product/detail?product_idx=";
		}
		return viewPage;
	}

	@PostMapping("/deleteCart")
	@ResponseBody
	public List<CartVo> deleteCart(HttpServletRequest req, HttpServletResponse res, CartVo cartVo, Model model) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		cartVo.setMember_idx(member_idx);
		int result = deleteService.deleteCart(cartVo);
		List<CartVo> cartList = null;
		if (result == 1) {// 정상적으로 입력된 경우, 해당 상품 페이지로 이동할 것
			cartList = listService.getCartList(member_idx);
			model.addAttribute("cartList", cartList);
		}
		return cartList;
	}
}
