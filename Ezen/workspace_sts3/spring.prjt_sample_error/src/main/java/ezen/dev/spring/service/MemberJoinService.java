package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("join") // 클래스 이름이 길어서 단축키 지정 join
public class MemberJoinService implements MemberService {

	private MemberDao memberDao;

	@Autowired(required = false)
	public MemberJoinService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int join(MemberVo memberVo) {
		return memberDao.join(memberVo);
	}

}
