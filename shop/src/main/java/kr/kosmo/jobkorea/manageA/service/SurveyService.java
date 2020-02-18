package kr.kosmo.jobkorea.manageA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageA.model.SurveyModel;
import kr.kosmo.jobkorea.supportA.model.NoticeMgtModel;

public interface SurveyService {

	/** 설문조사 목록 조회 */
	public List<SurveyModel> listSurvey(Map<String, Object> paramMap) throws Exception;
	
	/** 설문조사 목록 카운트 조회 */
	public int countListSurvey(Map<String, Object> paramMap) throws Exception;
	
	/** 설문조사 상세 조회 */
	public List<SurveyModel> detailSurvey(Map<String, Object> paramMap) throws Exception;

	/** 설문조사 상세 조회2 */
	public List<SurveyModel> surveyMgtDtl(Map<String, Object> paramMap) throws Exception;

	/** 설문조사 상세 카운트 */
	public int surveyMgtDtlCnt(Map<String, Object> paramMap) throws Exception;
}
