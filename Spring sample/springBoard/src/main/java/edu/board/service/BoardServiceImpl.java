package edu.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.board.dao.BoardDAO;
import edu.board.vo.BoardVO;
import edu.board.vo.SearchVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> list(SearchVO searchVO) {
		
		return boardDAO.list(searchVO);
	}

	@Override
	public int insert(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.insert(vo);
	}

	@Override
	public BoardVO selectOne(int bidx) {
		// TODO Auto-generated method stub
		return boardDAO.selectOne(bidx);
	}

	@Override
	public int update(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.update(vo);
	}

	@Override
	public int delete(int bidx) {
		// TODO Auto-generated method stub
		return boardDAO.delete(bidx);
	}  

}
