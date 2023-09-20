package ezen.maru.pjt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.FileVo;

@Repository
public class AdminDao {

	//////////////
	// MARU end //
	//////////////

	// MyBatis를 이용해서 DB작업을 할 수 있도록 지원하는 SqlSession객체를 멤버변수로
	// 정의하고 생성자를 통한 의존 자동주입이 이루어지도록 정의하시오.
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.maru.pjt.admin";

	@Autowired(required = false)
	public AdminDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int upload(FileVo fileVo) {
		return sqlSession.insert(MAPPER + ".upload", fileVo);
	}

	public List<FileVo> getFileList() {
		return sqlSession.selectList(MAPPER + ".getFileList");
	}

	/*
	 * file_tbl 정의문 create table file_tbl( file_idx int unsigned not null primary
	 * key auto_increment, origin_filename1 varchar(100), origin_filename2
	 * varchar(100), origin_filename3 varchar(100), system_filename1 varchar(100),
	 * system_filename2 varchar(100), system_filename3 varchar(100) )
	 * 
	 */

}
