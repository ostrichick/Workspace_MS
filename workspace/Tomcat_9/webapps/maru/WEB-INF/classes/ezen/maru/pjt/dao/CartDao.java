package ezen.maru.pjt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.CartVo;

@Repository
public class CartDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.maru.pjt.cart";

	@Autowired
	public CartDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<CartVo> getCartList(int member_idx) {
		return sqlSession.selectList(MAPPER + ".getCartList", member_idx);
	}

	public int updateCart(CartVo cartVo) {
		return sqlSession.update(MAPPER + ".updateCart", cartVo);
	}

	public int addCart(CartVo cartVo) {
		return sqlSession.update(MAPPER + ".addCart", cartVo);
	}

	public int deleteCart(CartVo cartVo) {
		return sqlSession.delete(MAPPER + ".deleteCart", cartVo);
	}
}
