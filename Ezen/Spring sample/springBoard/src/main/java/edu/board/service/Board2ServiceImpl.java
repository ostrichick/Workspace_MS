package edu.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.board.dao.Board2DAO;
import edu.board.vo.BoardVO;

@Service
public class Board2ServiceImpl implements Board2Service {

	@Autowired
	private Board2DAO board2Dao;
	
	public 	List<BoardVO> selectAll(){
		return board2Dao.selectAll();
	}
}
