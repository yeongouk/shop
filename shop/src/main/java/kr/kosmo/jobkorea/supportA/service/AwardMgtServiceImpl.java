package kr.kosmo.jobkorea.supportA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.supportA.dao.AwardMgtDao;
import kr.kosmo.jobkorea.supportA.model.AwardMgtDtlModel;
import kr.kosmo.jobkorea.supportA.model.AwardMgtDtlModel2;
import kr.kosmo.jobkorea.supportA.model.AwardMgtModel;

@Service
public class AwardMgtServiceImpl implements AwardMgtService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	AwardMgtDao awardMgtDao;
	
	/** 그룹코드 목록 조회 */
	public List<AwardMgtModel> listAwardMgt(Map<String, Object> paramMap) throws Exception {
		
		List<AwardMgtModel> listAwardMgt = awardMgtDao.listAwardMgt(paramMap);
		
		return listAwardMgt;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListAwardMgt(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = awardMgtDao.countListAwardMgt(paramMap);
		
		return totalCount;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListAwardMgt2(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = awardMgtDao.countListAwardMgt(paramMap);
		
		return totalCount;
	}
	
	/** 그룹코드 단건 조회 */
	public AwardMgtModel selectAwardMgt(Map<String, Object> paramMap) throws Exception {
		
		AwardMgtModel awardMgtModel = awardMgtDao.selectAwardMgt(paramMap);
		return awardMgtModel;
	}

	
	/** 상세코드 목록 조회 */
	public List<AwardMgtDtlModel> listAwardMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		List<AwardMgtDtlModel> listAwardMgt = awardMgtDao.listAwardMgtDtl(paramMap);
		
		return listAwardMgt;
	}
	
	/** 상세코드 목록 조회2 */
	public List<AwardMgtDtlModel2> listAwardMgtDtl2(Map<String, Object> paramMap) throws Exception {
		
		List<AwardMgtDtlModel2> listAwardMgt = awardMgtDao.listAwardMgtDtl2(paramMap);
		
		return listAwardMgt;
	}
	
	/** 그룹코드 목록 카운트 조회 */
	public int countListAwardMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = awardMgtDao.countListAwardMgtDtl(paramMap);
		
		return totalCount;
	}
	
	public int countListAwardMgtDtl2(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = awardMgtDao.countListAwardMgtDtl2(paramMap);
		
		return totalCount;
	}
	
	/** 상세코드 단건 조회 */
	public AwardMgtDtlModel awardMgtDtlModel(Map<String, Object> paramMap) throws Exception {
		
		AwardMgtDtlModel awardMgtDtlModel = awardMgtDao.selectAwardMgtDtl(paramMap);
		return awardMgtDtlModel;
	}
	
	/**수상내용 저장*/
	@Override
	public int insertAwardMgt(Map<String, Object> paramMap) throws Exception{
       
		
	
		int resultCnt = awardMgtDao.insertAwardMgt(paramMap);
		
		return resultCnt;
	}
	/**수상내용 수정*/
	@Override
	public int updateAwardMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = awardMgtDao.updateAwardMgt(paramMap);
		
		return resultCnt;
	}
	/**수상내용 삭제*/
	@Override
	public int deleteAwardMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = awardMgtDao.deleteAwardMgt(paramMap);
		
		return resultCnt;
	}
	
	/** 사용가능한 모든 공통코드 조회 */
	
	/*
	 * public List<AwardMgtUtilModel> listAllAwardMgt(Map<String, Object> paramMap)
	 * throws Exception {
	 * 
	 * List<AwardMgtUtilModel> listAwardMgt = awardMgtDao.listAllAwardMgt(paramMap);
	 * return listAwardMgt; }
	 */
	 
}
