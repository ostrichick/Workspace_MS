package ezen.dev.spring.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.dev.spring.dao.BoardDao;
import ezen.dev.spring.vo.FileVo;

@Service("b_list")
public class BoardListService implements BoardService {
	private BoardDao boardDao;

	@Autowired(required = false)
	public BoardListService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public List<FileVo> getBoardList() {
		return boardDao.getBoardList();
	}
}
