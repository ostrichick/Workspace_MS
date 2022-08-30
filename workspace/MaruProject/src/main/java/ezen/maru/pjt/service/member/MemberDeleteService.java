package ezen.maru.pjt.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.MemberDao;

@Service("m_delete")
public class MemberDeleteService implements MemberService {

	//////////////
	// MARU end //
	//////////////

	private MemberDao memberDao;

	@Autowired(required = false)
	public MemberDeleteService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int deleteMember(List<Integer> idxList) {
		return memberDao.deleteMember(idxList);
	}

}
