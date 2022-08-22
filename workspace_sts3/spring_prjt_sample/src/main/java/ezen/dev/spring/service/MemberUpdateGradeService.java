package ezen.dev.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("m_update_grade")
public class MemberUpdateGradeService implements MemberService {
	private MemberDao memberDao;

	@Autowired(required = false) // 생성자를 통한 자동 의존 주입
	public MemberUpdateGradeService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public int updateGrade(MemberVo memberVo) {
		return memberDao.updateGrade(memberVo);
	}
}
