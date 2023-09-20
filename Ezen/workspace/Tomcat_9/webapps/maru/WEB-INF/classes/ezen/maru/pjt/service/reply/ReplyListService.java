package ezen.maru.pjt.service.reply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ReplyDao;
import ezen.maru.pjt.vo.ReplyVo;

@Service("r_list")
public class ReplyListService implements ReplyService {
	private ReplyDao replyDao;

	@Autowired(required = false)
	public ReplyListService(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}

	@Override
	public List<ReplyVo> getReplyList(ReplyVo replyVo) {
		return replyDao.getReplyList(replyVo);
	}
}
