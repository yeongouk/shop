package kr.kosmo.jobkorea.peopleA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.peopleA.model.StudentJYOModel;

public interface StudentJYOService {
	
	/** 학생관리 목록 조회  */
	public List<StudentJYOModel> studentList(Map<String, Object> paramMap) throws Exception;
	
	/** 목록 숫자  추출  */
	public int studentTotalCnt(Map<String, Object> paramMap) throws Exception;
	
	/** 학생관리 단건 조회 */
	public StudentJYOModel selectStudent (Map<String, Object> paramMap) throws Exception;
	
	/** 학생관리 저장-신규등록 */
	public int insertStudent(Map<String, Object> paramMap) throws Exception;
	
	/** 학생관리 저장-수정 */
	public int updateStudent(Map<String, Object> paramMap) throws Exception;
	
	/** 학생 관리 삭제  */
	public int deleteStudent(Map<String, Object> paramMap) throws Exception;
	
}//StudentJYOService
