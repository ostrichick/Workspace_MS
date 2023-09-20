package ezen.maru.pjt.service.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.QnaDao;
import ezen.maru.pjt.vo.QnaVo;

@Service("q_delete")
public class QnaDeleteService implements QnaService {
	private QnaDao qnaDao;

	@Autowired(required = false)
	public QnaDeleteService(QnaDao qnaDao) {
		this.qnaDao = qnaDao;
	}

	@Override
	public int removeQna(QnaVo qnaVo) {
		return qnaDao.removeQna(qnaVo);
	}
}
