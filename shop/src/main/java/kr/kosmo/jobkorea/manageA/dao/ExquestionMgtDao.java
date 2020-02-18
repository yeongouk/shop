package kr.kosmo.jobkorea.manageA.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageA.model.ExquestionExamListModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionLectureBoxModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionMgtModel;
import kr.kosmo.jobkorea.manageA.model.ExquestionTestModel;

public interface ExquestionMgtDao {
	
	/** 시험관리 목록 조회 */
	public List<ExquestionMgtModel> selectExquestionListMgt(Map<String, Object> paramMap);
	
	/** 시험관리 Count 조회 */
	public int exquestionListTotalCnt(Map<String, Object> paramMap);
	
	/** 시험관리 목록 조회 */
	public List<ExquestionTestModel> exquestionTestList(Map<String, Object> paramMap);
	
	/** 시험관리 Count 조회 */
	public int exquestionTestListCnt(Map<String, Object> paramMap);
	
	/** 시험문제 목록 조회 */
	public List<ExquestionExamListModel> exquestionExamList(Map<String, Object> paramMap);
	
	/** 시험문제 Count 조회 */
	public int exquestionExamListCnt(Map<String, Object> paramMap);
	
	/** 시험문제 Insert */
	public int insertExamTestList(Map<String, Object> paramMap);
	
	public int insertExamTest(Map<String, Object> paramMap);
	
	public int examTestListCnt(Map<String, Object> paramMap);
	
	/** 시험문제 Update */
	public int updateExamTestList(Map<String, Object> paramMap);
	
	public int updateExamTest(Map<String, Object> paramMap);
	
	/** 시험문제 Delete */
	public int deleteExamTestList(Map<String, Object> paramMap);
	
	/** 강의정보 목록 조회 */
	public List<ExquestionLectureBoxModel> selectLectureTitle(Map<String, Object> paramMap);
	
	/** 시험명 Insert */
	public int insertTestNm(Map<String, Object> paramMap);
	
}
