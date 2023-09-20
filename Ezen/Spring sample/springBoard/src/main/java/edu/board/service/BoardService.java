package edu.board.service;

import java.util.List;

import edu.board.vo.BoardVO;
import edu.board.vo.SearchVO;

public interface BoardService {
	List<BoardVO> list(SearchVO searchVO);
	int insert(BoardVO vo);
	BoardVO selectOne(int bidx);
	int update(BoardVO vo);
	int delete(int bidx);
}
