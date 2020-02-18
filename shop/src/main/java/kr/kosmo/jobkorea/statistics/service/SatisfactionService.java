package kr.kosmo.jobkorea.statistics.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageD.model.SurveyResultModel;
import kr.kosmo.jobkorea.statistics.model.FailedNumModel;

public interface SatisfactionService {	

	// 과락인원 목록 전체조회(그래프 출력용)
	public List<SurveyResultModel> listSatisfactionForGraph(Map<String, Object> paramMap) throws Exception;

}
