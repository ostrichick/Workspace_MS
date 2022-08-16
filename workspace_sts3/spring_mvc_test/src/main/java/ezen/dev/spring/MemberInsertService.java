package ezen.dev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInsertService implements MemberService {
	// MemberService 인터페이스 - MemberServiceImpl 클래스
	private MemberDao memberDao;

	@Autowired(required = false)
	public int insert(MemberVo memberVo) {
		return memberDao.insert(memberVo);
	}

}
