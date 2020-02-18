package kr.kosmo.jobkorea.manageD.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageD.dao.ExamResultHDHDao;
import kr.kosmo.jobkorea.manageD.model.ExamResultDtlModel;
import kr.kosmo.jobkorea.manageD.model.ExamResultModel;

@Service
public class ExamResultHDHServiceImpl implements ExamResultHDHService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ExamResultHDHDao examResultDao;
	
	/** 시험결과 목록 조회 */
	@Override
	public List<ExamResultModel> listExamResult(Map<String, Object> paramMap) throws Exception {
		
		List<ExamResultModel> listExamResult = examResultDao.listExamResult(paramMap);
		
		return listExamResult;
	}

	/** 시험결과 목록 카운트 조회 */
	@Override
	public int countListExamResult(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = examResultDao.countListExamResult(paramMap);
		
		return totalCount;
	}

	/** 시험결과 상세 목록 조회 */
	@Override
	public List<ExamResultDtlModel> listExamResultDtl(Map<String, Object> paramMap) throws Exception {
		
		List<ExamResultDtlModel> listExamResultDtl = examResultDao.listExamResultDtl(paramMap);
		
		return listExamResultDtl;
	}

	/** 시험결과 상세 목록 카운트 조회 */
	@Override
	public int countListExamResultDtl(Map<String, Object> paramMap) throws Exception {
		
		int totalCount = examResultDao.countListExamResultDtl(paramMap);
		
		return totalCount;
	}
	
}
