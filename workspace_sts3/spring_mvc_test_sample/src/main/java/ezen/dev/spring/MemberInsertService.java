package ezen.dev.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberInsertService implements MemberService {
	private MemberDao memberDao;
	
	@Autowired(required=false)
	public MemberInsertService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	public int insert(MemberVo memberVo) {
		return memberDao.insert(memberVo);
	}
	//MemberInsertService인터페이스 - MemberInsertServiceImpl클래스
}
