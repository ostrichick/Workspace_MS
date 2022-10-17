package ezen.maru.pjt.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.OrderDao;
import ezen.maru.pjt.vo.OrderVo;

@Service("o_list")
public class OrderListService implements OrderService {
	private OrderDao orderDao;

	@Autowired(required = false)
	public OrderListService(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public List<OrderVo> getOrderList(int member_idx) {
		return orderDao.getOrderList(member_idx);
	}
}
