package ezen.maru.pjt.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.CartDao;
import ezen.maru.pjt.vo.CartVo;

@Service("c_list")
public class CartListService implements CartService {
	private CartDao cartDao;

	@Autowired(required = false)
	public CartListService(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public List<CartVo> getCartList(int member_idx) {
		return cartDao.getCartList(member_idx);
	}
}
