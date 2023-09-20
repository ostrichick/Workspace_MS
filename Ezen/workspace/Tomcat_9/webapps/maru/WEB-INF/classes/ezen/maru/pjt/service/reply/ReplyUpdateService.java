package ezen.maru.pjt.service.reply;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReplyDao;
import ezen.maru.pjt.vo.ReplyVo;

@Service("r_update")
public class ReplyUpdateService implements ReplyService {
	private ReplyDao replyDao;

	@Autowired(required = false)
	public ReplyUpdateService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public int editReply(ReplyVo replyVo) {
		return replyDao.editReply(replyVo);
	}

	@Override
	public int countReply(ReplyVo replyVo) {
		return replyDao.countReply(replyVo);
	}

}
