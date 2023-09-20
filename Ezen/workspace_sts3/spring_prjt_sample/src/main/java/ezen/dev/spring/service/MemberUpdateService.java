package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("m_update")
public class MemberUpdateService implements MemberService {
	private MemberDao memberDao;

	@Autowired(required = false) // 생성자를 통한 자동 의존 주입
	public MemberUpdateService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public MemberVo getMember(String member_id) {
		return memberDao.getMember(member_id);
	}

	@Override
	public int updateProcess(MemberVo memberVo) {
		return memberDao.updateProcess(memberVo);
	}

}
