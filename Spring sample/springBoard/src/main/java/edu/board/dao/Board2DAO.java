package edu.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.board.vo.BoardVO;

@Repository
public class Board2DAO {

	@Autowired
	private SqlSession sqlSession;
	
	public List<BoardVO> selectAll(){
		return sqlSession.selectList("edu.board.mapper.board2Mapper.list");
	}
	
}
