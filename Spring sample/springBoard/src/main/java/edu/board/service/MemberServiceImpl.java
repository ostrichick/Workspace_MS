package edu.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.board.dao.MemberDAO;
import edu.board.vo.MemberVO;


@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO dao;
	
	@Override
	public void regMember(MemberVO vo) {
		
		dao.insertMember(vo);
		
	}

	@Override
	public MemberVO selectOne(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.selectOne(vo);
	}

	@Override
	public List<MemberVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}

	@Override
	public int update(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.update(vo);
	}

	@Override
	public int delYN(int midx) {
		// TODO Auto-generated method stub
		return dao.delYN(midx);
	}

	@Override
	public MemberVO selectAdmin() {
		// TODO Auto-generated method stub
		return dao.selectAdmin();
	}

	@Override
	public int disCheck(String id) {
		// TODO Auto-generated method stub
		return dao.disCheck(id);
	}

}
