package edu.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.board.vo.MemberVO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public void insertMember(MemberVO vo) {
		int reuslt = sqlSession.insert("edu.board.mapper.memberMapper.regmember", vo);
	}
	
	public MemberVO selectOne(MemberVO vo) {
		return sqlSession.selectOne("edu.board.mapper.memberMapper.selectOne", vo);
	}
	
	public List<MemberVO> list(){
		return sqlSession.selectList("edu.board.mapper.memberMapper.list");
	}
	
	public int update(MemberVO vo) {
		return sqlSession.update("edu.board.mapper.memberMapper.update", vo);
	}
	
	
	public int delYN(int midx) {
		return sqlSession.update("edu.board.mapper.memberMapper.delYN", midx);
	}
	
	public MemberVO selectAdmin() {
		return sqlSession.selectOne("edu.board.mapper.memberMapper.adminInfo");
	}
	
	public int disCheck(String id) {
		return sqlSession.selectOne("edu.board.mapper.memberMapper.countId", id);
	}
	
}
