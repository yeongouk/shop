package kr.kosmo.jobkorea.supportC.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportC.model.LectureModel;

public interface LectureDao {

	List<Map<String, Object>> listLecture(Map<String, Object> paramMap);

	int countListLecture(Map<String, Object> paramMap);

	LectureModel selectLectureDtl(Map<String, Object> paramMap);

	int checkLecture(Map<String, Object> paramMap);

	void lectureDtlinit(Map<String, Object> paramMap) throws Exception;

	void lectureDtldele(Map<String, Object> paramMap) throws Exception;

	LectureModel selectLecturePlan(Map<String, Object> paramMap);

	
}
