package ezen.maru.pjt.service.board;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.dao.BoardDao;
import ezen.maru.pjt.vo.BoardVo;

@Service("b_update")
public class BoardUpdateService implements BoardService {
	private BoardDao boardDao;

	@Autowired(required = false)
	public BoardUpdateService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public int noticeEditProcess(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest req) {

		List<MultipartFile> fileList = uploadFile.getFiles("uploadFile");
		String upload_dir = "resources/upload";
		String realPath = req.getServletContext().getRealPath(upload_dir);
		// request.getServletContext() : Servlet3.0부터 지원
		System.out.println("STS의 실제 저장경로: " + realPath);
		System.out.println("fileList.size() : " + fileList.size());
		if (fileList.size() > 0) {
			for (int i = 0; i < fileList.size(); i++) {
				String origin_filename = fileList.get(i).getOriginalFilename();

				int dot_idx = origin_filename.lastIndexOf(".");
				String fileName1 = origin_filename.substring(0, dot_idx);
				String extension = origin_filename.substring(dot_idx + 1);
				String fileName2 = fileName1
						+ new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
				String system_filename = fileName2 + "." + extension;

				String fullPath1 = realPath + origin_filename;
				String fullPath2 = realPath + system_filename;

				try {
					// 업로드된 파일을 새롭게 만들어진 경로에 저장함
					fileList.get(i).transferTo(new File(fullPath1));
					fileList.get(i).transferTo(new File(fullPath2));

					// 썸네일 생성
					File originFile = new File(fullPath1);
					File thumbnail = new File(realPath, "s_" + origin_filename);
					BufferedImage image1 = ImageIO.read(originFile);
					BufferedImage image2 = new BufferedImage(300, 200, BufferedImage.TYPE_3BYTE_BGR);
					Graphics2D graphic = image2.createGraphics();
					graphic.drawImage(image1, 0, 0, 300, 200, null);
					ImageIO.write(image2, "png", thumbnail);

				} catch (Exception e) {
					e.printStackTrace();
				}

				switch (i) {
				case 0:
					boardVo.setFile_original(origin_filename);
					boardVo.setFile_system(system_filename);
					boardVo.setFile_extension(extension);
//					boardVo.setOrigin_filename1(origin_filename);
//					boardVo.setSystem_filename1(system_filename);
					break;
				case 1:
					boardVo.setOrigin_filename2(origin_filename);
					boardVo.setSystem_filename2(system_filename);
					break;
				case 2:
					boardVo.setOrigin_filename3(origin_filename);
					boardVo.setSystem_filename3(system_filename);
				}
			}
		}
		return boardDao.noticeEditProcess(boardVo);
	}

}
