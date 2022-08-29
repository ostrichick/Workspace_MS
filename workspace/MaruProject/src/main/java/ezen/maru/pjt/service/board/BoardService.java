package ezen.maru.pjt.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.vo.BoardVo;

public interface BoardService {

	default int board_insert(BoardVo boardVo, 
			MultipartRequest uploadFile, HttpServletRequest request) {
		return 0;
	}

	default List<BoardVo> getBoardList(){
		return null;
	}

}
