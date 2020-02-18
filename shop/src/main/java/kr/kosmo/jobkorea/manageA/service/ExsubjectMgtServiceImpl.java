package kr.kosmo.jobkorea.manageA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageA.dao.ExsubjectMgtDao;
import kr.kosmo.jobkorea.manageA.model.ExsubjectMgtDtlModel;
import kr.kosmo.jobkorea.manageA.model.ExsubjectMgtModel;

@Service
public class ExsubjectMgtServiceImpl implements ExsubjectMgtService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ExsubjectMgtDao exsubjectMgtDao;
	
	/** 수강목록 목록 조회 */
	public List<ExsubjectMgtModel> listExsubjectMgt(Map<String, Object> paramMap) throws Exception {
		
		List<ExsubjectMgtModel> listExsubjectMgt = exsubjectMgtDao.listExsubjectMgt(paramMap);
		
		return listExsubjectMgt;
	}
	
	/** 수강목록 목록 카운트 조회 */
	public int countListExsubjectMgt(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = exsubjectMgtDao.countListExsubjectMgt(paramMap);
		
		return totalCount;
	}
	
	
	/** 수강인원목록 목록 조회 */
	public List<ExsubjectMgtDtlModel> listExsubjectMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		List<ExsubjectMgtDtlModel> listExsubjectMgtDtl = exsubjectMgtDao.listExsubjectMgtDtl(paramMap);
		
		return listExsubjectMgtDtl;
	}
	
	/** 수강목록 목록 카운트 조회 */
	public int countListExsubjectMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = exsubjectMgtDao.countListExsubjectMgtDtl(paramMap);
		
		return totalCount;
	}
	
	
	 
}
