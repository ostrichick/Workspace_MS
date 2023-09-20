package ezen.maru.pjt.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.vo.BoardVo;

public interface BoardService {

	default List<BoardVo> getNoticeList() {
		return null;
	}

	default int noticeWriteProcess(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest req) {
		return 0;
	}

	default int noticeEditProcess(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest req) {
		return 0;
	}

	default int deleteNotice(int idx) {
		return 0;
	}
	//////////////
	// MARU end //
	//////////////

	default int board_insert(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest request) {
		return 0;
	}

	default List<BoardVo> getBoardList() {
		return null;
	}

	default BoardVo getNotice(int idx) {
		return null;
	}

}
