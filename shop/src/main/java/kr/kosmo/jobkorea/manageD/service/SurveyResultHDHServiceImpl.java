package kr.kosmo.jobkorea.manageD.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageD.dao.SurveyResultHDHDao;
import kr.kosmo.jobkorea.manageD.model.SurveyResultDtlModel;
import kr.kosmo.jobkorea.manageD.model.SurveyResultModel;

@Service
public class SurveyResultHDHServiceImpl implements SurveyResultHDHService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SurveyResultHDHDao surveyResultDao;
	
	/** 설문결과 목록 조회 */
	@Override
	public List<SurveyResultModel> listSurveyResult(Map<String, Object> paramMap) throws Exception {

		List<SurveyResultModel> listSurveyResult = surveyResultDao.listSurveyResult(paramMap);
		
		return listSurveyResult;
		
	}

	/** 설문결과 목록 카운트 조회 */
	@Override
	public int countListSurveyResult(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = surveyResultDao.countListSurveyResult(paramMap);
		
		return totalCount;
		
	}

	/** 설문결과 상세 목록 조회 */
	@Override
	public List<SurveyResultDtlModel> listSurveyResultDtl(Map<String, Object> paramMap) {
		
		List<SurveyResultDtlModel> listSurveyResultDtl = surveyResultDao.listSurveyResultDtl(paramMap);
		
		return listSurveyResultDtl;
		
	}

	/** 설문결과 상세 목록 카운트 조회 */
	@Override
	public int countListSurveyResultDtl(Map<String, Object> paramMap) {
		
		int totalCount = surveyResultDao.countListSurveyResultDtl(paramMap);
		
		return totalCount;
	}

	
	
}
