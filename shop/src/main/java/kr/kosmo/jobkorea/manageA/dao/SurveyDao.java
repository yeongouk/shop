package kr.kosmo.jobkorea.manageA.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageA.model.SurveyModel;

public interface SurveyDao {

	/** 설문조사 목록 조회 */
	public List<SurveyModel> surveyList(Map<String, Object> paramMap);
	
	/** 설문조사 목록 카운트 조회 */
	public int countListSurvey(Map<String, Object> paramMap);

	/** 설문조사 상세 조회 */
	public List<SurveyModel> detailSurvey(Map<String, Object> paramMap);

	/** 설문조사 상세 조회 2*/
	public List<SurveyModel> surveyMgtDtl(Map<String, Object> paramMap);
	
	/** 설문조사 상세 카운트 조회 */
	public int surveyMgtDtlCnt(Map<String, Object> paramMap);
}
