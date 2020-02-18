package kr.kosmo.jobkorea.order.dao;

import java.util.List;
import java.util.Map;


import kr.kosmo.jobkorea.order.model.OrderModel;

public interface OrderDao {

	/** 그룹코드 목록 조회 */
	public List<OrderModel> listComnGrpCod(Map<String, Object> paramMap);
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListComnGrpCod(Map<String, Object> paramMap);	
	
	/** 상세코드 목록 조회 */
	public List<OrderModel> listComnDtlCod(Map<String, Object> paramMap);
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListComnDtlCod(Map<String, Object> paramMap);

	public void insertComnDtlCod(Map<String, Object> paramMap);
	
	
	
	
}
