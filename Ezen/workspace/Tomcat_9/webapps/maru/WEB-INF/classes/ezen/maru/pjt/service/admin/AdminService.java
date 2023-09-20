package ezen.maru.pjt.service.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.vo.FileVo;

public interface AdminService {

  //////////////
  // MARU end //
  //////////////

  default int upload(MultipartRequest uploadFile, HttpServletRequest request) {
    return 0;
  }

  default List<FileVo> getFileList() {
    return null;
  }

  default Map<String, String> getStats() {
    return null;
  }

}
