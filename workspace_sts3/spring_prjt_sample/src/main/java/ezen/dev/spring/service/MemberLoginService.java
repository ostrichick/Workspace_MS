package ezen.dev.spring.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.MemberDao;
import ezen.dev.spring.vo.MemberVo;

@Service("login")
public class MemberLoginService implements MemberService {
	private MemberDao memberDao;

	@Autowired(required = false) // 생성자를 통한 자동 의존 주입
	public MemberLoginService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public MemberVo login(Map<String, String> loginMap) {
		return memberDao.login(loginMap);
	}
}
