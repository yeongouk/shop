package kr.kosmo.jobkorea.peopleA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.peopleA.dao.StudentJYODao;
import kr.kosmo.jobkorea.peopleA.model.StudentJYOModel;

@Service
public class StudentJYOServiceImpl implements StudentJYOService {

	//로그찍는용
	private final Logger logger = LogManager.getLogger(this.getClass());
		
	//로그분별용
	private final String className = this.getClass().toString();
	
	@Autowired
	StudentJYODao studentDao;
	
	/** 학생관리 목록 조회  */
	@Override
	public List<StudentJYOModel> studentList(Map<String, Object> paramMap) throws Exception{
		
		List<StudentJYOModel> studentList = studentDao.studentList(paramMap);
		
		return studentList;
	}

	/** 목록 숫자  추출  */
	@Override
	public int studentTotalCnt(Map<String, Object> paramMap) throws Exception {
		
		 int totalCnt = studentDao.studentTotalCnt(paramMap);
		
		return totalCnt;
	}

	/** 학생관리 단건 조회 */
	@Override
	public StudentJYOModel selectStudent(Map<String, Object> paramMap) throws Exception {
		
		StudentJYOModel studentJYOModel = studentDao.selectStudent(paramMap);
		
		return studentJYOModel;
	}
    
	/** 학생관리 저장-신규등록 */
	@Override
	public int insertStudent(Map<String, Object> paramMap) throws Exception {
		
		int ins = studentDao.insertStudent(paramMap);
		
		return ins;
	}

	/** 학생관리 저장-수정 */
	@Override
	public int updateStudent(Map<String, Object> paramMap) throws Exception {
		
		int ins = studentDao.updateStudent(paramMap);
		
		return ins;
	}

	/** 학생관리 삭제 */
	@Override
	public int deleteStudent(Map<String, Object> paramMap) throws Exception {

		int ins = studentDao.deleteStudent(paramMap);
		
		return ins;
	}
	
	
}//StudentJYOServiceImpl
