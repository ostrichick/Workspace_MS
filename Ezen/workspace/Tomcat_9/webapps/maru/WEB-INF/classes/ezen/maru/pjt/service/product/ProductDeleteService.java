package ezen.maru.pjt.service.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ezen.maru.pjt.dao.ProductDao;

@Service("p_delete")
public class ProductDeleteService implements ProductService {
	private ProductDao productDao;

	@Autowired(required = false)
	public ProductDeleteService(ProductDao productDao) {
		this.productDao = productDao;
	}

	@Override
	public int deleteProduct(int product_idx) {
		return productDao.deleteProduct(product_idx);
	}

}
