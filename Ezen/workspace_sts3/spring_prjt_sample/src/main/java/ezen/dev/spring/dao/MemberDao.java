package ezen.dev.spring.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.MemberVo;

@Repository // DAO클래스에 대한 표시, 스프링 컨테이너가 컴포넌트 스캔을 빈 등록
public class MemberDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.dev.spring.member";

	@Autowired(required = false)
	// SqlSession은 root-context.xml에 빈 SqlSessionTemplate으로 등록됨
	public MemberDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int join(MemberVo memberVo) { // DB와 관련된 작업을 위해 MyBatis 프레임워크의 SqlSession 객체 필요
		// SqlSession객체를 얻으면 해당 Mapper파일에 접근하여 SQL문을 처리하도록 요청함
		// 해당 Mapper가 가지고있는 namespace와 Mapper내에 정의된 DML작업태그의 id속성값으로 찾음
		// insert(ezen.dev.spring.member + .join)
		// 전달값이 있으면 두번째 매개변수 (, memberVo)로 정의

		return sqlSession.insert(MAPPER + ".join", memberVo);
		// SqlSession객체의 insert,update,delete 메소드는 SQL문의 실행결과로 적용된 행의 수를 반환함

	}

	public MemberVo login(Map<String, String> loginMap) {
		return sqlSession.selectOne(MAPPER + ".login", loginMap);
	}

	public MemberVo getMember(String member_id) {
		return sqlSession.selectOne(MAPPER + ".getMember", member_id);
	}

	public int updateProcess(MemberVo memberVo) {
		return sqlSession.update(MAPPER + ".updateProcess", memberVo);
	}

	public List<MemberVo> getMemberList() {
		return sqlSession.selectList(MAPPER + ".getMemberList");
	}

	public int updateGrade(MemberVo memberVo) {
		return sqlSession.update(MAPPER + ".updateGrade", memberVo);
	}

}

/*
 * create table member_tbl( member_idx int unsigned not null primary key
 * AUTO_INCREMENT, member_id varchar(50) not null unique, member_pw varchar(20)
 * not null, member_name varchar(30) not null, member_handphone varchar(20),
 * member_gender char(2), member_grade tinyint(1) default 0, reg_date datetime
 * default now(), del_yn char(2) default 'N' );
 */
