package kr.kosmo.jobkorea.supportD.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.kosmo.jobkorea.supportD.model.LecturePlanAtmtFilModel;
import kr.kosmo.jobkorea.supportD.model.LecturePlanModel;

/**
 * @author 이미혜
 * 작성일: 2020.01.20
 * 강사리스트
 */


public interface LecturePlanService {

	List<LecturePlanModel> lectureList(Map<String, Object> lectureMap);
	int lcnt(Map<String, Object> lectureMap);
	int insertLecture(Map<String, Object> reqParam, HttpServletRequest request) throws Exception;
	LecturePlanModel selectOneLectureDetail(String no);
	LecturePlanAtmtFilModel selectLecturePlanAtmtFil(Map<String, Object> reqParam) throws Exception;
	void updateLecture(Map<String, Object> reqParam);
	int updateLectureWithFile(Map<String, Object> reqParam, HttpServletRequest request) throws Exception;

}
