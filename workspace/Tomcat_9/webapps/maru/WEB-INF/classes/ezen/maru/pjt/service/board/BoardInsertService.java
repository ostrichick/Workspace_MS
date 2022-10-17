package ezen.maru.pjt.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.BoardDao;
import ezen.maru.pjt.vo.BoardVo;

@Service("b_insert")
public class BoardInsertService implements BoardService {
	private BoardDao boardDao;

	@Autowired(required = false)
	public BoardInsertService(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public int noticeWriteProcess(BoardVo boardVo) {
		return boardDao.noticeWriteProcess(boardVo);
	}

//	@Override
//	public int board_insert(BoardVo boardVo, MultipartRequest uploadFile, HttpServletRequest request) {
//		List<MultipartFile> fileList = uploadFile.getFiles("uploadFile");
//		String upload_dir = "resources/upload";
//		String realPath = request.getServletContext().getRealPath(upload_dir);
//		// request.getServletContext() : Servlet3.0부터 지원
//		System.out.println("STS의 실제 저장경로: " + realPath);
//
//		for (int i = 0; i < fileList.size(); i++) {
//			String origin_filename = fileList.get(i).getOriginalFilename();
//
//			int dot_idx = origin_filename.lastIndexOf(".");
//			String fileName1 = origin_filename.substring(0, dot_idx);
//			String extension = origin_filename.substring(dot_idx + 1);
//			String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
//			String system_filename = fileName2 + "." + extension;
//
//			String fullPath1 = realPath + origin_filename;
//			String fullPath2 = realPath + system_filename;
//
//			try {
//				// 업로드된 파일을 새롭게 만들어진 경로에 저장함
//				fileList.get(i).transferTo(new File(fullPath1));
//				fileList.get(i).transferTo(new File(fullPath2));
//
//				// 썸네일 생성
//				File originFile = new File(fullPath1);
//				File thumbnail = new File(realPath, "s_" + origin_filename);
//				BufferedImage image1 = ImageIO.read(originFile);
//				BufferedImage image2 = new BufferedImage(300, 200, BufferedImage.TYPE_3BYTE_BGR);
//				Graphics2D graphic = image2.createGraphics();
//				graphic.drawImage(image1, 0, 0, 300, 200, null);
//				ImageIO.write(image2, "png", thumbnail);
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
//			switch (i) {
//			case 0:
//				boardVo.setOrigin_filename1(origin_filename);
//				boardVo.setSystem_filename1(system_filename);
//				break;
//			case 1:
//				boardVo.setOrigin_filename2(origin_filename);
//				boardVo.setSystem_filename2(system_filename);
//				break;
//			case 2:
//				boardVo.setOrigin_filename3(origin_filename);
//				boardVo.setSystem_filename3(system_filename);
//			}
//
//		}
//
//		return boardDao.board_insert(boardVo);
//	}

}
