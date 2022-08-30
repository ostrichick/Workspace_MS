package ezen.maru.pjt.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.MemberDao;
import ezen.maru.pjt.vo.MemberVo;

@Service("join")
public class MemberJoinService implements MemberService {

	//////////////
	// MARU end //
	//////////////

	private MemberDao memberDao;

	@Autowired(required = false) // 생성자를 통한 자동 의존 주입
	public MemberJoinService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int join(MemberVo memberVo) {// 요청에 대한 처리를 위해 MemberDao객체가 필요함
		return memberDao.join(memberVo);
	}

}
