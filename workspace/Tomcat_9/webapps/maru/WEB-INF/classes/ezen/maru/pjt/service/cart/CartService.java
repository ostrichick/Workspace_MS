package ezen.maru.pjt.service.cart;

import java.util.List;

import ezen.maru.pjt.vo.CartVo;

public interface CartService {

	default List<CartVo> getCartList(int member_idx) {
		return null;
	}

	default int addCart(CartVo cartVo) {
		return 0;
	}

	default int updateCart(CartVo cartVo) {
		return 0;
	}

	default int deleteCart(CartVo cartVo) {
		return 0;
	}

}
