package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.kosmo.jobkorea.manageC.model.LectureLJKGrpModel;

public interface SurveyCService {
	
	public List<Map<String, Object>> listLectureGrp(Map<String, Object> paramMap);

	public int countListLectureGrp(Map<String, Object> paramMap);
	
	public Map<String, Object>  selectSurveyReg(Map<String, Object> paramMap) throws Exception;

	public void insertSurveyReg(Map<String, Object> paramMap) throws Exception;
}
