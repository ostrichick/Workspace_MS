package ezen.maru.pjt.service.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ezen.maru.pjt.vo.MemberVo;

public interface MemberService {

	//////////////
	// MARU end //
	//////////////

	// 디폴트 메소드와 정적 메소드는 JDK8부터 적용 가능
	// 강제성이 없음
	default int join(MemberVo memberVo) {
		return 0;
	}

	default MemberVo login(Map<String, String> loginMap) {
		return null;
	}

	default MemberVo getMember(String member_id) {
		return null;
	}

	default int update(MemberVo memberVo) {
		return 0;
	}

	default List<MemberVo> getMemberList() {
		return null;
	}

	default int updateGrade(HashMap<String, Integer> map) {
		return 0;
	}

	default int deleteMember(List<Integer> idx_list) {
		return 0;
	}

	default List<MemberVo> getUpdateList() {
		return null;
	}

	default List<MemberVo> getDeleteList() {
		return null;
	}

}
