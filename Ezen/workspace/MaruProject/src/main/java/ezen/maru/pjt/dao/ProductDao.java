package ezen.maru.pjt.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	private SqlSession sqlSession;

	private final String MAPPER = "ezen.maru.pjt.product";

	@Autowired(required = false)
	public ProductDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
