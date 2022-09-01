package ezen.maru.pjt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.BoardVo;

@Repository
public class BoardDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.maru.pjt.board";

	@Autowired
	public BoardDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public List<BoardVo> getNoticeList() {
		return sqlSession.selectList(MAPPER + ".getNoticeList");
	}

	public int noticeWriteProcess(BoardVo boardVo) {
		return sqlSession.insert(MAPPER + ".noticeWriteProcess", boardVo);
	}

	public BoardVo getNotice(int idx) {
		sqlSession.update(MAPPER + ".upHit", idx);
		return sqlSession.selectOne(MAPPER + ".getNotice", idx);
	}

	public int noticeEditProcess(BoardVo boardVo) {
		return sqlSession.update(MAPPER + ".noticeEditProcess", boardVo);
	}

	public int deleteNotice(int idx) {
		return sqlSession.update(MAPPER + ".noticeDeleteProcess", idx);
	}
	/////////////////////////////////////
	/////// 이 아래는 옛날 코드 /////////
	/////////////////////////////////////

	public int board_insert(BoardVo boardVo) {
		return sqlSession.insert(MAPPER + ".board_insert", boardVo);
	}

	public List<BoardVo> getBoardList() {
		return sqlSession.selectList(MAPPER + ".getBoardList");
	}

}

/*
 * board_tbl 정의문 create table board_tbl( board_idx int unsigned not null primary
 * key auto_increment, writer varchar(50) not null, title varchar(50) not null,
 * content varchar(1000) not null, price int not null, address varchar(100) not
 * null, reg_date datetime default now(), origin_filename1 varchar(50),
 * origin_filename2 varchar(50), origin_filename3 varchar(50), system_filename1
 * varchar(100), system_filename2 varchar(100), system_filename3 varchar(100),
 * member_idx int unsigned not null, constraint fk_member foreign
 * key(member_idx) references member_tbl(member_idx) );
 * 
 */
