package kr.kosmo.jobkorea.pc.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.pc.model.ProductModel;
import kr.kosmo.jobkorea.system.model.ComnCodUtilModel;
import kr.kosmo.jobkorea.system.model.ComnDtlCodModel;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;

public interface ProductDao {

	/** 상품 목록 조회 */
	public List<ProductModel> listProduct(Map<String, Object> paramMap);
	
	
	/** 상품 목록 카운트 조회 */
	public int countListProductModel(Map<String, Object> paramMap);

	/** 상품 단건 조회*/	
	public ProductModel selectProduct(Map<String, Object> paramMap);

	/** 상품 저장*/
	public int insertProduct(Map<String, Object> paramMap);

	/** 상품 수정*/
	public int updateProduct(Map<String, Object> paramMap);

	/** 상품 삭제*/
	public int deleteProduct(Map<String, Object> paramMap);

	
	

	
}
