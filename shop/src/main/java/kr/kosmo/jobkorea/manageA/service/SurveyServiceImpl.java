package kr.kosmo.jobkorea.manageA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageA.dao.SurveyDao;
import kr.kosmo.jobkorea.manageA.model.SurveyModel;

@Service
public class SurveyServiceImpl implements SurveyService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SurveyDao surveyDao;
	
	@Override
	public List<SurveyModel> listSurvey(Map<String, Object> paramMap) throws Exception {
		List<SurveyModel> listSurvey = surveyDao.surveyList(paramMap);
		return listSurvey;
		
	}

	@Override
	public int countListSurvey(Map<String, Object> paramMap) throws Exception {

		int totalCount = surveyDao.countListSurvey(paramMap);
		return totalCount;
	}

	@Override
	public List<SurveyModel> detailSurvey(Map<String, Object> paramMap) throws Exception {
		// 상세정보 가져오기 
		List<SurveyModel> detailSurvey = surveyDao.detailSurvey(paramMap);
		
		return detailSurvey;
	}

	@Override
	public List<SurveyModel> surveyMgtDtl(Map<String, Object> paramMap) throws Exception {
		//상세정보 가져오기
		List<SurveyModel> surveyMgtDtl = surveyDao.surveyMgtDtl(paramMap);
		return surveyMgtDtl;
	}

	@Override
	public int surveyMgtDtlCnt(Map<String, Object> paramMap) throws Exception {

		int totalCount = surveyDao.surveyMgtDtlCnt(paramMap);
		
		return totalCount;
	}

}
