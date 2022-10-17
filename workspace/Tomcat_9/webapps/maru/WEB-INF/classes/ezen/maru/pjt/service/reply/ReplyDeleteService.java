package ezen.maru.pjt.service.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReplyDao;
import ezen.maru.pjt.vo.ReplyVo;

@Service("r_delete")
public class ReplyDeleteService implements ReplyService {
	private ReplyDao replyDao;

	@Autowired(required = false)
	public ReplyDeleteService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public int removeReply(ReplyVo replyVo) {
		return replyDao.removeReply(replyVo);
	}
}
