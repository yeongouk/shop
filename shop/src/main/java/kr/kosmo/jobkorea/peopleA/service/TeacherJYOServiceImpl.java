package kr.kosmo.jobkorea.peopleA.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.peopleA.dao.TeacherJYODao;
import kr.kosmo.jobkorea.peopleA.model.TeacherJYOModel;

@Service
public class TeacherJYOServiceImpl implements TeacherJYOService {

	//로그찍는용
	private final Logger logger = LogManager.getLogger(this.getClass());
			
	//로그분별용
	private final String className = this.getClass().toString();
	
	@Autowired
	TeacherJYODao teacherDao;

	/** 강사관리 목록 조회  */
	@Override
	public List<TeacherJYOModel> teacherList(Map<String, Object> paramMap) throws Exception {
		
		List<TeacherJYOModel> teacherList = teacherDao.teacherList(paramMap);
		
		return teacherList;
	}

	/** 목록 숫자  추출  */
	@Override
	public int teacherTotalCnt(Map<String, Object> paramMap) throws Exception {
		
		int teacherTotalCnt = teacherDao.teacherTotalCnt(paramMap);
		
		return teacherTotalCnt;
	}

	/** 강사관리 단건 조회*/
	@Override
	public TeacherJYOModel selectTeacher(Map<String, Object> paramMap) throws Exception {
		
		TeacherJYOModel teacherJYOModel = teacherDao.selectTeacher(paramMap);
		
		return teacherJYOModel;
	}
	
	/** 강사관리 저장-신규등록 */
	@Override
	public int insertTeacher(Map<String, Object> paramMap) throws Exception {
		
		int ins = teacherDao.insertTeacher(paramMap);
		
		return ins;
	}
	
	/** 강사관리 저장-수정 */
	@Override
	public int updateTeacher(Map<String, Object> paramMap) throws Exception {
		
		int ins = teacherDao.updateTeacher(paramMap);
		
		return ins;
	}
	
	/**강사관리 삭제 */
	@Override
	public int deleteTeacher(Map<String, Object> paramMap) throws Exception {
		
		int ins = teacherDao.deleteTeacher(paramMap);
		
		return ins;
	}
	
	
}//TeacherJYOServiceImpl

