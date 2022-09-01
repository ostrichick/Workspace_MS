package ezen.maru.pjt.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.BoardDao;

@Service("b_delete")
public class BoardDeleteService implements BoardService {
	private BoardDao boardDao;

	@Autowired(required = false)
	public BoardDeleteService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public int deleteNotice(int idx) {
		return boardDao.deleteNotice(idx);
	}
}
