package edu.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.board.vo.BoardVO;
import edu.board.vo.SearchVO;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	
	public List<BoardVO> list(SearchVO searchVO){
		
		return sqlSession.selectList("edu.board.mapper.boardMapper.list",searchVO);
	}
	
	public int insert(BoardVO vo) {
		return sqlSession.insert("edu.board.mapper.boardMapper.insert", vo);
	}
	
	public BoardVO selectOne(int bidx) {
		return sqlSession.selectOne("edu.board.mapper.boardMapper.selectOne", bidx);
	}
	
	public int update(BoardVO vo) {
		return sqlSession.update("edu.board.mapper.boardMapper.update", vo);
	}
	
	public int delete(int bidx) {
		return sqlSession.delete("edu.board.mapper.boardMapper.delete", bidx);
	}
}
