package ezen.maru.pjt.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.CartDao;
import ezen.maru.pjt.vo.CartVo;

@Service("c_update")
public class CartUpdateService implements CartService {
	private CartDao cartDao;

	@Autowired(required = false)
	public CartUpdateService(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public int updateCart(CartVo cartVo) {
		return cartDao.updateCart(cartVo);
	}

}
