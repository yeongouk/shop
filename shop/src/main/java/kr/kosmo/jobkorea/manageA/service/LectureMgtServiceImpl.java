package kr.kosmo.jobkorea.manageA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageA.dao.LectureMgtDao;
import kr.kosmo.jobkorea.manageA.model.LectureMgtCodModel;
import kr.kosmo.jobkorea.manageA.model.LectureMgtDtlCodModel;

@Service
public class LectureMgtServiceImpl implements LectureMgtService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	LectureMgtDao lectureMgtDao;
	
	/** 수강목록 목록 조회 */
	public List<LectureMgtCodModel> listLectureMgt(Map<String, Object> paramMap) throws Exception {
		
		List<LectureMgtCodModel> listLectureMgt = lectureMgtDao.listLectureMgt(paramMap);
		
		return listLectureMgt;
	}
	
	/** 수강목록 목록 카운트 조회 */
	public int countListLectureMgt(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = lectureMgtDao.countListLectureMgt(paramMap);
		
		return totalCount;
	}
	
	/** 수강목록 단건 조회 */
	public LectureMgtCodModel selectLectureMgt(Map<String, Object> paramMap) throws Exception {
		
		LectureMgtCodModel lectureMgtModel = lectureMgtDao.selectLectureMgt(paramMap);
		return lectureMgtModel;
	}
	
	/** 수강목록 저장 */
	public int insertLectureMgt(Map<String, Object> paramMap) throws Exception {
		
		int ret = lectureMgtDao.insertLectureMgt(paramMap);
		
		return ret;
	}
	
	/** 수강목록 수정 */
	public int updateLectureMgt(Map<String, Object> paramMap) throws Exception {
		
		int ret = lectureMgtDao.updateLectureMgt(paramMap);
		return ret;
	}
	
	/** 수강목록 삭제 */
	public int deleteLectureMgt(Map<String, Object> paramMap) throws Exception {
		
		int ret = lectureMgtDao.deleteLectureMgt(paramMap);
		
		return ret;
	}
	
	/** 수강인원목록 목록 조회 */
	public List<LectureMgtDtlCodModel> listLectureMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		List<LectureMgtDtlCodModel> listLectureMgt = lectureMgtDao.listLectureMgtDtl(paramMap);
		
		return listLectureMgt;
	}
	
	/** 수강목록 목록 카운트 조회 */
	public int countListLectureMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = lectureMgtDao.countListLectureMgtDtl(paramMap);
		
		return totalCount;
	}
	
	/** 수강인원목록 단건 조회 */
	public LectureMgtDtlCodModel selectLectureMgtDtl(Map<String, Object> paramMap) throws Exception {
		
		LectureMgtDtlCodModel lectureMgtModel = lectureMgtDao.selectLectureMgtDtl(paramMap);
		return lectureMgtModel;
	}
	
	
	 
}
