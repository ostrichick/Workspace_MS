package ezen.maru.pjt.service.memberinfo;

import ezen.maru.pjt.vo.MemberInfoVo;

public interface MemberInfoService {

	default int signup(MemberInfoVo memberInfoVo) {
		return 0;
	}

	default MemberInfoVo signin(MemberInfoVo memberInfoVoParam) {
		return null;
	}

	default MemberInfoVo getMember(String member_id) {
		return null;
	}

	default int update(MemberInfoVo memberInfoVo) {
		return 0;
	}

	default int delete(MemberInfoVo memberInfoVo) {
		return 0;
	}
}
