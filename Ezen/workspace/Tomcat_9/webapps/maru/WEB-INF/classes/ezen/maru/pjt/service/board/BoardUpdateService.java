package ezen.maru.pjt.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.BoardDao;
import ezen.maru.pjt.vo.BoardVo;

@Service("b_update")
public class BoardUpdateService implements BoardService {
	private BoardDao boardDao;

	@Autowired(required = false)
	public BoardUpdateService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public int noticeEditProcess(BoardVo boardVo) {
		return boardDao.noticeEditProcess(boardVo);
	}

}
