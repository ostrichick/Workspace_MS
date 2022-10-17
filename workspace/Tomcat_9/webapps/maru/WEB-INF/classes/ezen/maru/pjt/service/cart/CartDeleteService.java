package ezen.maru.pjt.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.CartDao;
import ezen.maru.pjt.vo.CartVo;

@Service("c_delete")
public class CartDeleteService implements CartService {
	private CartDao cartDao;

	@Autowired(required = false)
	public CartDeleteService(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public int deleteCart(CartVo cartVo) {
		return cartDao.deleteCart(cartVo);
	}

}
