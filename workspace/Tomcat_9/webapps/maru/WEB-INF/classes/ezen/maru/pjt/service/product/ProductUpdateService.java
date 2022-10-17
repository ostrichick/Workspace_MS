package ezen.maru.pjt.service.product;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.dao.ProductDao;
import ezen.maru.pjt.vo.ProductVo;

@Service("p_update")
public class ProductUpdateService implements ProductService {
	private ProductDao productDao;

	@Autowired(required = false)
	public ProductUpdateService(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public int productEdit(ProductVo productVo, MultipartRequest uploadFile, HttpServletRequest request) {
		return productDao.productEdit(productVo);
	}

}
