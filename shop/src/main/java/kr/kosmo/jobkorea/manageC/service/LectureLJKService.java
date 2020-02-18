package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

public interface LectureLJKService {


	public int countListLectureGrp(Map<String, Object> paramMap);


	public int updateLectureGrp(Map<String, Object> paramMap);

	public List<Map<String, Object>> listLecttureGrp(Map<String, Object> paramMap);


	public Map<String, Object> selectLectureDtl(Map<String, Object> paramMap);
	
}
