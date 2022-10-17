package ezen.maru.pjt.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.CartDao;
import ezen.maru.pjt.vo.CartVo;

@Service("c_insert")
public class CartInsertService implements CartService {
	private CartDao cartDao;

	@Autowired(required = false)
	public CartInsertService(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public int addCart(CartVo cartVo) {
		return cartDao.addCart(cartVo);
	}
}
