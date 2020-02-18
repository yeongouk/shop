package kr.kosmo.jobkorea.supportA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.supportA.dao.AdviceMgtDao;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtDtlModel;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtDtlModel2;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtModel;

@Service
public class AdviceMgtServiceImpl implements AdviceMgtService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	AdviceMgtDao adviceMgtDao;
	
	/** 그룹코드 목록 조회 */
	public List<AdviceMgtModel> listAdviceMgt(Map<String, Object> paramMap) throws Exception {
		
		List<AdviceMgtModel> listAdviceMgt = adviceMgtDao.listAdviceMgt(paramMap);
		
		return listAdviceMgt;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListAdviceMgt(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = adviceMgtDao.countListAdviceMgt(paramMap);
		
		return totalCount;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListAdviceMgt2(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = adviceMgtDao.countListAdviceMgt(paramMap);
		
		return totalCount;
	}
	
	/** 그룹코드 단건 조회 */
	public AdviceMgtModel selectAdviceMgt(Map<String, Object> paramMap) throws Exception {
		
		AdviceMgtModel adviceMgtModel = adviceMgtDao.selectAdviceMgt(paramMap);
		return adviceMgtModel;
	}

	
	/** 상세코드 목록 조회 */
	public List<AdviceMgtDtlModel> listAdviceMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		List<AdviceMgtDtlModel> listAdviceMgt = adviceMgtDao.listAdviceMgtDtl(paramMap);
		
		return listAdviceMgt;
	}
	
	/** 상세코드 목록 조회2 */
	public List<AdviceMgtDtlModel2> listAdviceMgtDtl2(Map<String, Object> paramMap) throws Exception {
		
		List<AdviceMgtDtlModel2> listAdviceMgt = adviceMgtDao.listAdviceMgtDtl2(paramMap);
		
		return listAdviceMgt;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListAdviceMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = adviceMgtDao.countListAdviceMgtDtl(paramMap);
		
		return totalCount;
	}
	
	public int countListAdviceMgtDtl2(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = adviceMgtDao.countListAdviceMgtDtl2(paramMap);
		
		return totalCount;
	}
	
	/** 상세코드 단건 조회 */
	public AdviceMgtDtlModel selectAdviceMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		AdviceMgtDtlModel adviceMgtModel = adviceMgtDao.selectAdviceMgtDtl(paramMap);
		return adviceMgtModel;
	}
	
	/**수상내용 저장*/
	@Override
	public int insertAdviceMgt(Map<String, Object> paramMap) throws Exception{
       
		/*
		 * int numResult1 = adviceMgtDao.numPlusMgt1(); paramMap.put("no", numResult1);
		 * // 번호 여기에 추가
		 */		int resultCnt = adviceMgtDao.insertAdviceMgt(paramMap);
		
		return resultCnt;
	}
	/**수상내용 수정*/
	@Override
	public int updateAdviceMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = adviceMgtDao.updateAdviceMgt(paramMap);
		
		return resultCnt;
	}
	/**수상내용 삭제*/
	@Override
	public int deleteAdviceMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = adviceMgtDao.deleteAdviceMgt(paramMap);
		
		return resultCnt;
	}
	 
}
