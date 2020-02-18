package kr.kosmo.jobkorea.manageC.dao;

import java.util.List;
import java.util.Map;

public interface SurveyCDAO {
	
	public List<Map<String, Object>> listLectureGrp(Map<String, Object> paramMap);

	public int countListLectureGrp(Map<String, Object> paramMap);
	
	public Map<String, Object> selectSurveyReg(Map<String, Object> paramMap);

	public void insertSurveyReg(Map<String, Object> paramMap);
}
