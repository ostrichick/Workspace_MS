package ezen.dev.spring.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.dev.spring.vo.FileVo;

@Repository
public class AdminDao {
	// MyBatis를 이용해서 DB작업을 할 수 있도록 SqlSession 객체를 멤버변수로 정의, 생성자를 통한 의존 자동주입
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.dev.spring.admin";

	@Autowired(required = false) // 생성자를 통한 자동 의존주입
	// SqlSession은 root-context.xml에 빈(SqlSessionTemplate)으로 등록되어져 있음
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int upload(FileVo fileVo) {
		return sqlSession.insert(MAPPER + ".upload", fileVo);
	}
	/*
	 * file_tbl 정의문
	 * 
	 * create file_tbl( file_idx int unsigned not null primary key auto_increment,
	 * origin_filename1 varchar(100), origin_filename2 varchar(100),
	 * origin_filename3 varchar(100), system_filename1 varchar(100),
	 * system_filename2 varchar(100), system_filename3 varchar(100))
	 * 
	 */

	public List<FileVo> getFileList() {
		return sqlSession.selectList(MAPPER + ".getFileList");
	}
}
