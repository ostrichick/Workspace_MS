package ezen.maru.pjt.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.BoardDao;
import ezen.maru.pjt.vo.BoardVo;

@Service("b_list")
public class BoardListService implements BoardService {

	@Override
	public List<BoardVo> getNoticeList() {
		return boardDao.getNoticeList();
	}

	@Override
	public BoardVo getNotice(int idx) {
		return boardDao.getNotice(idx);
	}

	//////////////
	// MARU end //
	//////////////

	private BoardDao boardDao;

	@Autowired(required = false)
	public BoardListService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<BoardVo> getBoardList() {
		return boardDao.getBoardList();
	}

}
