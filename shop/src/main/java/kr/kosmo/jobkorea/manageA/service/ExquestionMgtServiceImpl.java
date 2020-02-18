package kr.kosmo.jobkorea.manageA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageA.dao.ExquestionMgtDao;
import kr.kosmo.jobkorea.manageA.model.ExquestionExamListModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionLectureBoxModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionMgtModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionTestModel;

@Service
public class ExquestionMgtServiceImpl implements ExquestionMgtService {
	
	@Autowired
	ExquestionMgtDao exquestionMgtDao;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	/** 시험관리 목록 조회 */
	@Override
	public List<ExquestionMgtModel> selectExquestionListMgt(Map<String, Object> paramMap) throws Exception {

		List<ExquestionMgtModel> ExquestionListMgt = exquestionMgtDao.selectExquestionListMgt(paramMap);
		
		return ExquestionListMgt;
	}
	
	/** 시험관리 Count 조회 */
	@Override
	public int exquestionListTotalCnt(Map<String, Object> paramMap) throws Exception {

		int totalCnt = exquestionMgtDao.exquestionListTotalCnt(paramMap);
		
		return totalCnt;
	}
	
	/** 시험관리 목록 조회 */
	@Override
	public List<ExquestionTestModel> exquestionTestList(Map<String, Object> paramMap) throws Exception {

		List<ExquestionTestModel> ExquestionListMgt = exquestionMgtDao.exquestionTestList(paramMap);
		
		return ExquestionListMgt;
	}
	
	/** 시험관리 Count 조회 */
	@Override
	public int exquestionTestListCnt(Map<String, Object> paramMap) throws Exception {
	
		int totalCnt = exquestionMgtDao.exquestionTestListCnt(paramMap);
		
		return totalCnt;
	}
	
	/** 시험문제 목록 조회 */
	public List<ExquestionExamListModel> exquestionExamList(Map<String, Object> paramMap) throws Exception {

		List<ExquestionExamListModel> exquestionExamListMgt = exquestionMgtDao.exquestionExamList(paramMap);
		
		return exquestionExamListMgt;
	}
	
	/** 시험관리 Count 조회 */
	@Override
	public int exquestionExamListCnt(Map<String, Object> paramMap) throws Exception {

		int totalCnt = exquestionMgtDao.exquestionExamListCnt(paramMap);
		
		return totalCnt;
	}
	
	/** 시험문제 Insert */
	@Override
	public int insertExamTestList(Map<String, Object> paramMap) throws Exception{
       
		int resultCnt = exquestionMgtDao.insertExamTestList(paramMap);
		
		int numResult = exquestionMgtDao.exquestionExamListCnt(paramMap);
		
		double average = 100 / numResult;
		
		paramMap.put("seqMax", Math.round(average));
		paramMap.put("inOrDe", "inOrDe");
		
		exquestionMgtDao.updateExamTest(paramMap);

		return resultCnt;
	}
	
	/** 시험문제 Update */
	@Override
	public int updateExamData(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = exquestionMgtDao.updateExamTestList(paramMap);
		
//		int resultCnt1 = exquestionMgtDao.updateExamTest(paramMap);
		
		return resultCnt;
	}
	
	/** 시험문제 Delete */
	@Override
	public int deleteExamTestList(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = exquestionMgtDao.deleteExamTestList(paramMap);
		
		int numResult = exquestionMgtDao.exquestionExamListCnt(paramMap);
		
		double average = 100 / numResult;
		
		paramMap.put("seqMax", Math.round(average));
		paramMap.put("inOrDe", "inOrDe");
		
		exquestionMgtDao.updateExamTest(paramMap);
		return resultCnt;
	}
	
	/** 강의정보 목록 조회 */
	@Override
	public List<ExquestionLectureBoxModel> selectLectureTitle(Map<String, Object> paramMap) throws Exception {
		
		List<ExquestionLectureBoxModel> selectLectureTitle = exquestionMgtDao.selectLectureTitle(paramMap);
		
		return selectLectureTitle;
	}
	
	/** 시험명 Insert */
	@Override
	public int insertTestNm(Map<String, Object> paramMap) throws Exception {
		
		int resultCnt = exquestionMgtDao.insertTestNm(paramMap);

		return resultCnt;
	}

	
}
