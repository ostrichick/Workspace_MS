package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.BoardVo;
import ezen.dev.spring.vo.FileVo;

@Repository
public class BoardDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.dev.spring.board";

	@Autowired(required = false)
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int board_insert(BoardVo boardVo) {
		return sqlSession.insert(MAPPER + ".upload", boardVo);
	}

	public List<FileVo> getBoardList() {
		return sqlSession.selectList(MAPPER + ".getBoardList");
	}
}
