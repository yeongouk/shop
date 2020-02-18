package kr.kosmo.jobkorea.supportD.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportD.model.LecturePlanAtmtFilModel;
import kr.kosmo.jobkorea.supportD.model.LecturePlanModel;

/**
 * @author 이미혜
 * 작성일 2020.01.21
 * 강사 리스트
 */

public interface LecturePlanDao {

	public List<LecturePlanModel> lecturePlanList(Map<String, Object> paramMap);

	public int lCnt(Map<String, Object> paramMap);

	public int insertLecture(Map<String, Object> reqParam);

	public LecturePlanModel selectOneLectureDetail(String no);

	public int findNextLectureNo();

	public LecturePlanAtmtFilModel selectLecturePlanAtmtFil(Map<String, Object> reqParam);
	
	public int updateLecture(Map<String, Object> reqParam);

	public int updateLectureWithFile(Map<String, Object> reqParam);
	
	

}
