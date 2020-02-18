package kr.kosmo.jobkorea.supportC.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.supportC.dao.LectureDao;
import kr.kosmo.jobkorea.supportC.model.LectureModel;
import kr.kosmo.jobkorea.system.model.ComnDtlCodModel;

@Service
public class LectureServiceImpl implements LectureService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	LectureDao lectureDao;

	@Override
	public List<Map<String, Object>> listLecture(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return lectureDao.listLecture(paramMap);
	}

	@Override
	public int countListLecture(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return lectureDao.countListLecture(paramMap);
	}

	@Override
	public LectureModel selectsLecture(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return lectureDao.selectLectureDtl(paramMap);
	}

	@Override
	public int checkLecture(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return lectureDao.checkLecture(paramMap);
	}

	@Override
	public void lectureDtlinit(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		lectureDao.lectureDtlinit(paramMap);
		
	}

	@Override
	public void lectureDtldele(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		lectureDao.lectureDtldele(paramMap);
		
	}

	@Override
	public LectureModel selectLecturePlan(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		LectureModel list = lectureDao.selectLecturePlan(paramMap);
		return list;
	}

	
	
}
