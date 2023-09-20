package ezen.maru.pjt.service.memberinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.MemberInfoDao;
import ezen.maru.pjt.vo.MemberInfoVo;

@Service("signin")
public class MemberInfoSigninService implements MemberInfoService {
	private MemberInfoDao memberInfoDao;

	@Autowired(required = false)
	public MemberInfoSigninService(MemberInfoDao memberInfoDao) {
		this.memberInfoDao = memberInfoDao;
	}

	@Override
	public MemberInfoVo signin(MemberInfoVo memberInfoVo) {
		return memberInfoDao.signin(memberInfoVo);
	}

	@Override
	public MemberInfoVo getCryptedMemberPw(MemberInfoVo memberInfoVo) {
		return memberInfoDao.getCryptedMemberPw(memberInfoVo);
	}
}
