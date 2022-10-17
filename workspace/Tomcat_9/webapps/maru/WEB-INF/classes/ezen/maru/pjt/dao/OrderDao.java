package ezen.maru.pjt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.OrderProductVo;
import ezen.maru.pjt.vo.OrderVo;

@Repository
public class OrderDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.maru.pjt.order";

	@Autowired
	public OrderDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<OrderVo> getOrderList(int member_idx) {
		return sqlSession.selectList(MAPPER + ".getOrderList", member_idx);
	}

	public int updateOrder(OrderVo orderVo) {
		return sqlSession.update(MAPPER + ".updateOrder", orderVo);
	}

	public int addOrder(OrderVo orderVo, String[] checkedItemList, List<OrderProductVo> orderProductList) {
		System.out.println(orderVo);
		sqlSession.update(MAPPER + ".addOrder", orderVo);
		int order_idx = orderVo.getOrder_idx();
		for (OrderProductVo orderProductVo : orderProductList) {
			orderProductVo.setOrder_idx(order_idx);
		}
		System.out.println("orderProductList in DAO : " + orderProductList);
		if (checkedItemList != null && checkedItemList.length > 0) {
			sqlSession.delete("ezen.maru.pjt.cart" + ".deleteItems", checkedItemList);
		}
		return sqlSession.update(MAPPER + ".addOrderProduct", orderProductList);
	}

	public int deleteOrder(OrderVo orderVo) {
		return sqlSession.delete(MAPPER + ".deleteOrder", orderVo);
	}
}
