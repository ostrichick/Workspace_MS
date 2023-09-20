package ezen.maru.pjt.service.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.QnaDao;
import ezen.maru.pjt.vo.QnaVo;

@Service("q_update")
public class QnaUpdateService implements QnaService {
	private QnaDao qnaDao;

	@Autowired(required = false)
	public QnaUpdateService(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public int editQna(QnaVo qnaVo) {
		return qnaDao.editQna(qnaVo);
	}

}
