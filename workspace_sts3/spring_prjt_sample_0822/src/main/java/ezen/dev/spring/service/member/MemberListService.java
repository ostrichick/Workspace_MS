package ezen.dev.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("m_list")
public class MemberListService implements MemberService {
	
	private MemberDao memberDao;
	
	@Autowired(required=false)//생성자를 통한 자동 의존 주입
	public MemberListService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	@Override
	public List<MemberVo> getMemberList() {
		return memberDao.getMemberList();
	}
	
	@Override
	public List<MemberVo> getUpdateList() {
		return memberDao.getUpdateList();
	}

	@Override
	public List<MemberVo> getDeleteList() {
		return memberDao.getDeleteList();
	}
}
