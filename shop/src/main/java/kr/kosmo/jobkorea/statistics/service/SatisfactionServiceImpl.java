package kr.kosmo.jobkorea.statistics.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageD.model.SurveyResultModel;
import kr.kosmo.jobkorea.statistics.dao.FailedNumDao;
import kr.kosmo.jobkorea.statistics.dao.SatisfactionDao;
import kr.kosmo.jobkorea.statistics.model.FailedNumModel;

@Service
public class SatisfactionServiceImpl implements SatisfactionService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SatisfactionDao dao;
	
	// 과락인원 목록 조회
	

	// 과락인원 목록 전체조회(그래프 출력용)
	@Override
	public List<SurveyResultModel> listSatisfactionForGraph(Map<String, Object> paramMap) throws Exception {
		List<SurveyResultModel> failedNumModel = dao.listSatisfactionForGraph(paramMap);
		return failedNumModel;
	}
	
}
