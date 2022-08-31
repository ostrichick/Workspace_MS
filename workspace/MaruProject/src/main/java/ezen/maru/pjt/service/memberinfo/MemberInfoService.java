package ezen.maru.pjt.service.memberinfo;

import ezen.maru.pjt.vo.MemberInfoVo;

public interface MemberInfoService {

	default int signup(MemberInfoVo memberInfoVo) {
		return 0;
	}
}
