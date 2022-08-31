package ezen.maru.pjt.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.MemberInfoVo;

@Repository
public class MemberInfoDao {
	private SqlSession sqlSession;

	private final String MAPPER = "ezen.maru.pjt.memberInfo";

	@Autowired(required = false) // 생성자를 통한 자동 의존주입
	// SqlSession은 root-context.xml에 빈(SqlSessionTemplate)으로 등록되어져 있음
	public MemberInfoDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int signup(MemberInfoVo memberInfoVo) {// DB와 관련된 작업을 위해 MyBatis 프레임워크의
		// SqlSession객체가 필요함. SqlSession객체를 얻으면 그것을 가지고 해당 Mapper 파일에 접근해서
		// SQL문을 처리하도록 요청하면 됨. 해당 Mapper파일을 찾는 것은 Mapper가 가지고 있는 네임스페이스와
		// Mapper 내에 정의된 DML작업 태그가 가지고 있는 id 속성값을 이용해서 찾음. 전달값이 있으면
		// 두번째 매개변수(memberVo)로 정의해줌.

		return sqlSession.insert(MAPPER + ".signup", memberInfoVo);
		// SqlSession객체의 insert, update, delete 메소드는 SQL문의 실행 결과로 처리된 행의 수를 반환함
	}

	public MemberInfoVo signin(MemberInfoVo memberInfoVo) {
		return sqlSession.selectOne(MAPPER + ".signin", memberInfoVo);
	}

	public MemberInfoVo getMember(String member_id) {
		return sqlSession.selectOne(MAPPER + ".getMember", member_id);
	}

	public int update(MemberInfoVo memberInfoVo) {
		return sqlSession.update(MAPPER + ".updateMember", memberInfoVo);
	}

}
