package ezen.maru.pjt.service.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartRequest;

import ezen.maru.pjt.vo.ProductVo;

public interface ProductService {

	default List<ProductVo> getProductList(String product_major_category) {
		return null;
	}

	default int productAdd(ProductVo productVo, MultipartRequest uploadFile1, HttpServletRequest req) {
		return 0;
	}

	default ProductVo getProduct(int product_idx) {
		return null;
	}

	default int productEdit(ProductVo productVo, MultipartRequest uploadFile, HttpServletRequest req) {
		return 0;
	}

	default int deleteProduct(int product_idx) {
		return 0;
	}

}
