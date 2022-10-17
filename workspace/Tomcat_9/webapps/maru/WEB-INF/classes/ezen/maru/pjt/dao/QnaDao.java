package ezen.maru.pjt.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ezen.maru.pjt.vo.QnaVo;

@Repository
public class QnaDao {
  private SqlSession sqlSession;
  private final String MAPPER = "ezen.maru.pjt.qna";

  @Autowired
  public QnaDao(SqlSession sqlSession) {
    this.sqlSession = sqlSession;
  }

  public List<QnaVo> getQnaList(QnaVo qnaVo) {
    return sqlSession.selectList(MAPPER + ".getQnaList", qnaVo);
  }

  public List<QnaVo> getAnswerList(QnaVo qnaVo) {
    return sqlSession.selectList(MAPPER + ".getAnswerList", qnaVo);
  }

  public int writeQna(QnaVo qnaVo) {
    return sqlSession.insert(MAPPER + ".writeQna", qnaVo);
  }

  public int editQna(QnaVo qnaVo) {
    return sqlSession.update(MAPPER + ".editQna", qnaVo);
  }

  public int removeQna(QnaVo qnaVo) {
    return sqlSession.update(MAPPER + ".removeQna", qnaVo);
  }

  public List<QnaVo> getAllQuestionList() {
    return sqlSession.selectList(MAPPER + ".getAllQuestionList");
  }

  public int writeAnswer(QnaVo qnaVo) {
    sqlSession.insert(MAPPER + ".writeAnswer", qnaVo);
    return sqlSession.update(MAPPER + ".markAnswered", qnaVo);
  }

  public List<QnaVo> getQnaListMember(int member_idx) {
    System.out.println("memberidx dao : " + member_idx);
    return sqlSession.selectList(MAPPER + ".getQnaListMember", member_idx);
  }

}