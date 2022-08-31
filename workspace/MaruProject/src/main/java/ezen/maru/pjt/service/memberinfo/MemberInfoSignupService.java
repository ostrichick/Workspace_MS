package ezen.maru.pjt.service.memberinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.MemberInfoDao;
import ezen.maru.pjt.vo.MemberInfoVo;

@Service("signup")
public class MemberInfoSignupService implements MemberInfoService {

	private MemberInfoDao memberInfoDao;

	@Autowired(required = false) // 생성자를 통한 자동 의존 주입
	public MemberInfoSignupService(MemberInfoDao memberInfoDao) {
		this.memberInfoDao = memberInfoDao;
	}

	@Override
	public int signup(MemberInfoVo memberInfoVo) {// 요청에 대한 처리를 위해 MemberDao객체가 필요함
		return memberInfoDao.signup(memberInfoVo);
	}

}
