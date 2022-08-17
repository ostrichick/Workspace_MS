package ezen.dev.spring.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;

@Repository
public class MemberDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.dev.spring.member";

	@Autowired(required = false)
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int join(MemberVo memberVo) {
		return sqlSession.insert(MAPPER + ".join", memberVo);
	}
}
