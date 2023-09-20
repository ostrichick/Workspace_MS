package ezen.dev.spring.service;

import java.util.List;
import java.util.Map;

import ezen.dev.spring.vo.MemberVo;

public interface MemberService {

	// default는 JDK8부터 적용가능
	// 구현클래스가 반드시 구현해야한다는 강제성이 없음
	default int join(MemberVo memberVo) {
		return 0;
	}

	default MemberVo login(Map<String, String> loginMap) {
		return null;
	}

	default MemberVo getMember(String member_id) {
		return null;
	}

	default int updateProcess(MemberVo memberVo) {
		return 0;
	}

	default List<MemberVo> getMemberList() {
		return null;
	}

	default int updateGrade(MemberVo memberVo) {
		return 0;
	}
}
