package ezen.maru.pjt.service.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.QnaDao;
import ezen.maru.pjt.vo.QnaVo;

@Service("q_insert")
public class QnaInsertService implements QnaService {
  private QnaDao qnaDao;

  @Autowired(required = false)
  public QnaInsertService(QnaDao qnaDao) {
    this.qnaDao = qnaDao;
  }

  @Override
  public int writeQna(QnaVo qnaVo) {
    return qnaDao.writeQna(qnaVo);
  }

  @Override
  public int writeAnswer(QnaVo qnaVo) {
    return qnaDao.writeAnswer(qnaVo);
  }

}
