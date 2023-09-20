package ezen.dev.spring.service.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.vo.FileVo;

public interface BoardService {

	default int board_insert(FileVo fileVo, MultipartRequest uploadFile, HttpServletRequest req) {
		return 0;
	}

	default List<FileVo> getBoardList() {
		return null;
	}

}
