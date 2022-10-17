package ezen.maru.pjt.service.memberinfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.MemberInfoDao;
import ezen.maru.pjt.vo.MemberInfoVo;

@Service("member_update")
public class MemberInfoUpdateService implements MemberInfoService {
	private MemberInfoDao memberInfoDao;

	@Autowired(required = false)
	public MemberInfoUpdateService(MemberInfoDao memberInfoDao) {
		this.memberInfoDao = memberInfoDao;
	}

	@Override
	public MemberInfoVo getMember(String member_id) {
		return memberInfoDao.getMember(member_id);
	}

	@Override
	public int update(MemberInfoVo memberInfoVo) {
		return memberInfoDao.update(memberInfoVo);
	}

	@Override
	public int delete(MemberInfoVo memberInfoVo) {
		return memberInfoDao.delete(memberInfoVo);
	}

}
