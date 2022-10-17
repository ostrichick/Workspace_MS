package ezen.maru.pjt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.ReplyVo;

@Repository
public class ReplyDao {
	private SqlSession sqlSession;
	private final String MAPPER = "ezen.maru.pjt.reply";

	@Autowired
	public ReplyDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	public int countReply(ReplyVo replyVo) {
		return sqlSession.update(MAPPER + ".countReply", replyVo);
	}

	public List<ReplyVo> getReplyList(ReplyVo replyVo) {
//		System.out.println("replyVo input in Dao : " + replyVo);
//		System.out.println("return in DAO : " + sqlSession.selectList(MAPPER + ".getReplyList", replyVo));
		return sqlSession.selectList(MAPPER + ".getReplyList", replyVo);
	}

	public int writeReply(ReplyVo replyVo) {
//		System.out.println("replyVo in DAO : " + replyVo);
		return sqlSession.insert(MAPPER + ".writeReply", replyVo);
	}

	public int editReply(ReplyVo replyVo) {
		return sqlSession.update(MAPPER + ".editReply", replyVo);
	}

	public int removeReply(ReplyVo replyVo) {
//		System.out.println("replyVo in DAO: " + replyVo);
		return sqlSession.update(MAPPER + ".removeReply", replyVo);
	}

}