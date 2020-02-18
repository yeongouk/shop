package kr.kosmo.jobkorea.order.service;

import java.util.List; 
import java.util.Map;



import kr.kosmo.jobkorea.order.model.OrderModel;

public interface OrderService {

	/** 그룹코드 목록 조회 */
	public List<OrderModel> listComnGrpCod(Map<String, Object> paramMap) throws Exception;

	/** 그룹코드 목록 카운트 조회 */
	public int countListComnGrpCod(Map<String, Object> paramMap) throws Exception;

	/** 상세코드 목록 조회 */
	public List<OrderModel> listComnDtlCod(Map<String, Object> paramMap) throws Exception;

	/** 상세 목록 카운트 조회 */
	public int countListComnDtlCod(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> insertComnDtlCod(Map<String, Object> paramMap);


}
