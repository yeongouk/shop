package kr.kosmo.jobkorea.pc.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.pc.dao.ProductDao;
import kr.kosmo.jobkorea.pc.model.ProductModel;


@Service
public class ProductServiceImpl implements ProductService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ProductDao productDao;
	
	/** 그룹코드 목록 조회 */
	
	public List<ProductModel> listProduct(Map<String, Object> paramMap) throws Exception {
		
		List<ProductModel> listProduct = productDao.listProduct(paramMap);
		
		return listProduct;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListProductModel(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = productDao.countListProductModel(paramMap);
		
		return totalCount;
	}

	/** 상품 단건 조회*/
	public ProductModel selectProduct(Map<String, Object> paramMap) throws Exception {
		ProductModel productModel = productDao.selectProduct(paramMap);
		return productModel;
	}

	/** 상품 저장*/
	public int insertProduct(Map<String, Object> paramMap) throws Exception {
		
		int pro = productDao.insertProduct(paramMap);
		return pro;
	}

	/** 상품 단건 조회*/
	public int updateProduct(Map<String, Object> paramMap) throws Exception {
		
		int pro = productDao.updateProduct(paramMap);
		return pro;
	}

	/**상품 삭제*/
	public int deleteProduct(Map<String, Object> paramMap) throws Exception {
		
		int pro = productDao.deleteProduct(paramMap);
		return pro;
	}


	

}
