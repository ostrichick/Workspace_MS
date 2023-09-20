package ezen.maru.pjt.service.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReplyDao;
import ezen.maru.pjt.vo.ReplyVo;

@Service("r_insert")
public class ReplyInsertService implements ReplyService {
	private ReplyDao replyDao;

	@Autowired(required = false)
	public ReplyInsertService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public int writeReply(ReplyVo replyVo) {
		return replyDao.writeReply(replyVo);
	}
}
