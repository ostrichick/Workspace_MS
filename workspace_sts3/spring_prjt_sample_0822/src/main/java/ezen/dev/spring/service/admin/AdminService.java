package ezen.dev.spring.service.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.dev.spring.vo.FileVo;

public interface AdminService {

	default int upload(MultipartRequest uploadFile, HttpServletRequest req) {
		return 0;
	}

	default List<FileVo> getFileList() {
		return null;
	}

}
