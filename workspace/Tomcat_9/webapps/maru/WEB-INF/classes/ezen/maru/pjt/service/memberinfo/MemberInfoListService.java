package ezen.maru.pjt.service.memberinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.MemberInfoDao;
import ezen.maru.pjt.vo.MemberInfoVo;

@Service("m_list")
public class MemberInfoListService implements MemberInfoService {
	private MemberInfoDao memberInfoDao;

	@Autowired(required = false)
	public MemberInfoListService(MemberInfoDao memberInfoDao) {
		this.memberInfoDao = memberInfoDao;
	}

	@Override
	public List<MemberInfoVo> getMemberInfoList() {
		return memberInfoDao.getMemberInfoList();
	}

}
