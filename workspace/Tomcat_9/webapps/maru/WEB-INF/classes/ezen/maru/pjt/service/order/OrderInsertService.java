package ezen.maru.pjt.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.OrderDao;
import ezen.maru.pjt.vo.OrderProductVo;
import ezen.maru.pjt.vo.OrderVo;

@Service("o_insert")
public class OrderInsertService implements OrderService {
	private OrderDao orderDao;

	@Autowired(required = false)
	public OrderInsertService(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public int addOrder(OrderVo orderVo, String[] checkedItemList, List<OrderProductVo> orderProductList) {
		return orderDao.addOrder(orderVo, checkedItemList, orderProductList);
	}
}
