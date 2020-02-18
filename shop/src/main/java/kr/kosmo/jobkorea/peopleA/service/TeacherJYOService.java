package kr.kosmo.jobkorea.peopleA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.peopleA.model.TeacherJYOModel;


public interface TeacherJYOService {
	
	/** 학생관리 목록 조회  */
	public List<TeacherJYOModel> teacherList(Map<String, Object> paramMap) throws Exception;

	/** 목록 숫자  추출  */
	public int teacherTotalCnt(Map<String, Object> paramMap) throws Exception;
	
	/** 학생관리 단건 조회 */
	public TeacherJYOModel selectTeacher(Map<String, Object> paramMap) throws Exception;
	
	/** 학생관리 저장-신규등록 */
	public int insertTeacher(Map<String, Object> paramMap) throws Exception;
	
	/** 학생관리 저장-수정 */
	public int updateTeacher(Map<String, Object> paramMap) throws Exception;
	
	/** 학생 관리 삭제  */
	public int deleteTeacher(Map<String, Object> paramMap) throws Exception;
	
}//TeacherJYOService
