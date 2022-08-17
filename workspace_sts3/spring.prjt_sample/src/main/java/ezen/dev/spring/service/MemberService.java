package ezen.dev.spring.service;

import ezen.dev.spring.vo.MemberVo;

public interface MemberService {

	// default 설정안하면 모든 구현클래스에서 구현해야되기때문ㅇ ㅔdefault 사용. 의미없는 body 사용
	default int join(MemberVo memberVo) {
		return 0;
	}
}
