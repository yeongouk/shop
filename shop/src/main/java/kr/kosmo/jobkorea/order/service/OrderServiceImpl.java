package kr.kosmo.jobkorea.order.service;

import java.util.List; 
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.order.model.OrderModel;
import kr.kosmo.jobkorea.order.dao.OrderDao;

@Service
public class OrderServiceImpl implements OrderService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	OrderDao orderDao;

	/** 그룹코드 목록 조회 */
	public List<OrderModel> listComnGrpCod(Map<String, Object> paramMap) throws Exception {

		List<OrderModel> listComnGrpCod = orderDao.listComnGrpCod(paramMap);

		return listComnGrpCod;
	}

	/** 그룹코드 목록 카운트 조회 */
	public int countListComnGrpCod(Map<String, Object> paramMap) throws Exception {

		int totalCount = orderDao.countListComnGrpCod(paramMap);

		return totalCount;
	}

	/** 상세코드 목록 조회 */
	public List<OrderModel> listComnDtlCod(Map<String, Object> paramMap) throws Exception {

		List<OrderModel> listComnGrpCod = orderDao.listComnDtlCod(paramMap);

		return listComnGrpCod;
	}

	/** 상세 목록 카운트 조회 */
	public int countListComnDtlCod(Map<String, Object> paramMap) throws Exception {

		int totalCount = orderDao.countListComnDtlCod(paramMap);

		return totalCount;
	}

	@Override
	public List<Map<String, Object>> insertComnDtlCod(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
	
		orderDao.insertComnDtlCod(paramMap);
		
		return null;
	}

	

	
	
	
}
