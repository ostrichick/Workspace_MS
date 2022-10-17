package ezen.maru.pjt.service.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.OrderDao;
import ezen.maru.pjt.vo.OrderVo;

@Service("o_update")
public class OrderUpdateService implements OrderService {
	private OrderDao orderDao;

	@Autowired(required = false)
	public OrderUpdateService(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int updateOrder(OrderVo orderVo) {
		return orderDao.updateOrder(orderVo);
	}

}
