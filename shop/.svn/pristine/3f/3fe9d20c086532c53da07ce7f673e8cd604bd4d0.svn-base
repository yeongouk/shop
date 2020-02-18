package kr.kosmo.jobkorea.statistics.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.statistics.dao.FailedNumDao;
import kr.kosmo.jobkorea.statistics.model.FailedNumModel;

@Service
public class FailedServiceImpl implements FailedService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	FailedNumDao failedNumDao;
	
	// 과락인원 목록 조회
	@Override
	public List<FailedNumModel> listFailedNum(Map<String, Object> paramMap) throws Exception {
		List<FailedNumModel> listFailedNum = failedNumDao.listFailedNum(paramMap);
		return listFailedNum;
	}

	// 과락인원 목록 카운트 조회
	@Override
	public int countListFailedNum(Map<String, Object> paramMap) throws Exception {
		int totalCount = failedNumDao.countListFailedNum(paramMap);
		return totalCount;
	}

	// 과락인원 목록 전체조회(그래프 출력용)
	@Override
	public List<FailedNumModel> listFailedNumForGraph(Map<String, Object> paramMap) throws Exception {
		List<FailedNumModel> failedNumModel = failedNumDao.listFailedNumForGraph(paramMap);
		return failedNumModel;
	}
	
}
