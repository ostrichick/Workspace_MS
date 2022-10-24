package edu.board.service;

import java.util.List;

import edu.board.vo.MemberVO;

public interface MemberService {
	void regMember(MemberVO vo);
	MemberVO selectOne(MemberVO vo);
	List<MemberVO> list();
	int update(MemberVO vo);
	int delYN(int midx);
	MemberVO selectAdmin();
	int disCheck(String id);
}
