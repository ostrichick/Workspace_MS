package ezen.maru.pjt.service.reply;

import java.util.List;

import ezen.maru.pjt.vo.ReplyVo;

public interface ReplyService {

	default public int countReply(ReplyVo replyVo) {
		return 0;
	}

	default List<ReplyVo> getReplyList(ReplyVo replyVo) {
		return null;
	}

	default int writeReply(ReplyVo replyVo) {
		return 0;
	}

	default int editReply(ReplyVo replyVo) {
		return 0;
	}

	default int removeReply(ReplyVo replyVo) {
		return 0;
	}

}
