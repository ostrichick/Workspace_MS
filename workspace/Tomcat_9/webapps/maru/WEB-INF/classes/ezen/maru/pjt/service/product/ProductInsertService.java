package ezen.maru.pjt.service.product;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.dao.ProductDao;
import ezen.maru.pjt.vo.ProductVo;

@Service("p_insert")
public class ProductInsertService implements ProductService {
	private ProductDao productDao;

	@Autowired(required = false)
	public ProductInsertService(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public int productAdd(ProductVo productVo, MultipartRequest uploadFile, HttpServletRequest req) {

		MultipartFile file = uploadFile.getFile("uploadFile");

		String upload_dir = "resources/upload";
		String realPath = req.getServletContext().getRealPath(upload_dir);

		System.out.println("STS의 실제 저장경로: " + realPath);
		String origin_filename = file.getOriginalFilename();
		int dot_idx = origin_filename.lastIndexOf(".");
		String fileName1 = origin_filename.substring(0, dot_idx);
		String extension = origin_filename.substring(dot_idx + 1);
		String fileName2 = fileName1 + new SimpleDateFormat("_yyyyMMdd_hhmmss").format(System.currentTimeMillis());
		String system_filename = fileName2 + "." + extension;

		String fullPath1 = realPath + origin_filename;
		String fullPath2 = realPath + system_filename;

		try {
			// 업로드된 파일을 새롭게 만들어진 경로에 저장함
			file.transferTo(new File(fullPath1));
			file.transferTo(new File(fullPath2));

			// 썸네일 생성
			File originFile = new File(fullPath1);
			File thumbnail = new File(realPath, "s_" + origin_filename);
			BufferedImage image1 = ImageIO.read(originFile);
			BufferedImage image2 = new BufferedImage(500, 500, BufferedImage.TYPE_3BYTE_BGR);
			Graphics2D graphic = image2.createGraphics();
			graphic.drawImage(image1, 0, 0, 500, 500, null);
			ImageIO.write(image2, "png", thumbnail);

		} catch (Exception e) {
			e.printStackTrace();
		}
		productVo.setFile_original(origin_filename);
		productVo.setFile_system(system_filename);
		productVo.setFile_extension(extension);

		return productDao.productAdd(productVo);
	}
}
