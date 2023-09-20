package ezen.maru.pjt.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.QnaDao;
import ezen.maru.pjt.vo.QnaVo;

@Service("q_list")
public class QnaListService implements QnaService {
  private QnaDao qnaDao;

  @Autowired(required = false)
  public QnaListService(QnaDao qnaDao) {
    this.qnaDao = qnaDao;
  }

  @Override
  public List<QnaVo> getQnaList(QnaVo qnaVo) {
    return qnaDao.getQnaList(qnaVo);
  }

  @Override
  public List<QnaVo> getAnswerList(QnaVo qnaVo) {
    return qnaDao.getAnswerList(qnaVo);
  }

  @Override
  public List<QnaVo> getAllQuestionList() {
    return qnaDao.getAllQuestionList();
  }

  @Override
  public List<QnaVo> getQnaListMember(int member_idx) {
    return qnaDao.getQnaListMember(member_idx);
  }

}
