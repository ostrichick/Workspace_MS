package ezen.maru.pjt.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ezen.maru.pjt.service.memberinfo.MemberInfoService;
import ezen.maru.pjt.service.order.OrderService;
import ezen.maru.pjt.vo.MemberInfoVo;
import ezen.maru.pjt.vo.OrderProductVo;
import ezen.maru.pjt.vo.OrderVo;

@Controller
@RequestMapping("/order")
public class OrderController {
	OrderService insertService, listService, updateService, deleteService;
	MemberInfoService mUpdateService;

	@Autowired(required = false)
	public void setListService(@Qualifier("o_list") OrderService listService) {
		this.listService = listService;
	}

	@Autowired(required = false)
	public void setInsertService(@Qualifier("o_insert") OrderService insertService) {
		this.insertService = insertService;
	}

	@Autowired(required = false)
	public void setUpdateService(@Qualifier("o_update") OrderService updateService) {
		this.updateService = updateService;
	}

	@Autowired(required = false)
	public void setDeleteService(@Qualifier("o_delete") OrderService deleteService) {
		this.deleteService = deleteService;
	}

	@Autowired(required = false)
	public void setMUpdateService(@Qualifier("member_update") MemberInfoService mUpdateService) {
		this.mUpdateService = mUpdateService;
	}

	// checkedItemList = 장바구니 목록에서 선택된 아이템들의 cart_idx
	// cart_product_number = 장바구니 각각 아이템의 구매 갯수
	// product_idx_list = 장바구니 목록 아이템들의 product_idx
	@PostMapping("/order")
	public String order(@RequestParam(required = false) String[] checkedItemList, String[] cart_product_number,
			String[] product_idx_list, String order_total_price, HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		String member_id = (String) session.getAttribute("member_id");
		MemberInfoVo memberInfoVo = mUpdateService.getMember(member_id);

//		System.out.println("Controller checkedItemList : " + Arrays.toString(checkedItemList));
//		System.out.println("Controller cart_product_number : " + Arrays.toString(cart_product_number));
//		System.out.println("Controller product_idx_list : " + Arrays.toString(product_idx_list));
//		System.out.println("Controller order_total_price : " + order_total_price);

		List<OrderProductVo> orderProductList = new ArrayList<OrderProductVo>();
		if (product_idx_list.length == cart_product_number.length) {
			for (int i = 0; i < product_idx_list.length; i++) {
				OrderProductVo orderProductVo = new OrderProductVo();
				orderProductVo.setProduct_idx(Integer.parseInt(product_idx_list[i]));
				orderProductVo.setOrder_quantity(Integer.parseInt(cart_product_number[i]));
				orderProductList.add(orderProductVo);
			}
		}

		model.addAttribute("memberInfoVo", memberInfoVo);
		model.addAttribute("order_total_price", order_total_price);
		session.setAttribute("checkedItemList", checkedItemList);
		session.setAttribute("orderProductList", orderProductList);
		// 세션에 List<OrderProductVo> 전송하려면 직렬화가 권장됨. 가능하다면 다른방법 찾을 것
		return "order/order";
	}

	@RequestMapping("/order_process")
	@ResponseBody
	public Map<String, Object> order_process(@RequestBody Map<String, Object> rsp) {
		boolean validate = rsp.get("paid_amount").equals(rsp.get("order_total_price"));
		rsp.put("money_validate", validate);
		if (validate) {
			rsp.put("message", "금액 일치");
		} else {
			rsp.put("message", "금액이 일치하지 않음");
		}

		return rsp;
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/order_complete")
	public String order_complete(HttpServletRequest req, OrderVo orderVo, String rsp, Model model) {
		HttpSession session = req.getSession();
		Optional<Object> optional_member_idx = Optional.ofNullable(session.getAttribute("member_idx"));
		int member_idx = (int) optional_member_idx.get();
		orderVo.setMember_idx(member_idx);

		String[] checkedItemList = (String[]) session.getAttribute("checkedItemList");
		Object orderProductList_obj = (Object) session.getAttribute("orderProductList");
		List<OrderProductVo> orderProductList = null;
		if (orderProductList_obj != null) {
			orderProductList = (ArrayList<OrderProductVo>) orderProductList_obj;
		}
		System.out.println("orderProductList in Controller : " + orderProductList);
		int result = insertService.addOrder(orderVo, checkedItemList, orderProductList);
		System.out.println("result is : " + result);
		model.addAttribute("rsp", rsp);
		System.out.println("rsp is : " + rsp);
		if (result > 0) {
			session.removeAttribute("checkedItemList");
			session.removeAttribute("orderProductList");
		}
		return "order/order_complete";
	}

	@GetMapping("/order_detail")
	public String order_detail() {
		return "order/order_detail";
	}

	@GetMapping("/order_refund")
	public String order_refund() {
		return "order/order_refund";
	}
}
