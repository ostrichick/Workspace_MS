package ezen.maru.pjt.service.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.OrderDao;
import ezen.maru.pjt.vo.OrderVo;

@Service("o_delete")
public class OrderDeleteService implements OrderService {
	private OrderDao orderDao;

	@Autowired(required = false)
	public OrderDeleteService(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int deleteOrder(OrderVo orderVo) {
		return orderDao.deleteOrder(orderVo);
	}

}
