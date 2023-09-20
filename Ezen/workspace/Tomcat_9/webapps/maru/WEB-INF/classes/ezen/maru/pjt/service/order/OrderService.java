package ezen.maru.pjt.service.order;

import java.util.List;

import ezen.maru.pjt.vo.OrderProductVo;
import ezen.maru.pjt.vo.OrderVo;

public interface OrderService {

	default List<OrderVo> getOrderList(int member_idx) {
		return null;
	}

	default int addOrder(OrderVo orderVo, String[] checkedItemList, List<OrderProductVo> orderProductList) {
		return 0;
	}

	default int updateOrder(OrderVo orderVo) {
		return 0;
	}

	default int deleteOrder(OrderVo orderVo) {
		return 0;
	}

}
