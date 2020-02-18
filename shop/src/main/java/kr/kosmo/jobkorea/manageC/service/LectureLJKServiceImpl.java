package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageC.dao.LectureLJKDao;
import kr.kosmo.jobkorea.manageC.model.LectureLJKGrpModel;
import kr.kosmo.jobkorea.manageD.model.LectureGrpModel;


@Service
public class LectureLJKServiceImpl implements LectureLJKService {

	@Autowired
	LectureLJKDao lectureDao;
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
		
		/*
		 * List<LectureGrpModel> listLectureGrp = lectureDao.listLectureGrp(paramMap);
		 * 
		 * return listLectureGrp;
		 */


	@Override
	public int countListLectureGrp(Map<String, Object> paramMap) {
		
		int countListLectureGrp = lectureDao.countListLectureGrp(paramMap);
		return countListLectureGrp;
		
	}

	@Override
	public int updateLectureGrp(Map<String, Object> paramMap) {
		
		int ret = lectureDao.updateLectureGrp(paramMap);
		return ret;
		
	}

	@Override
	public List<Map<String, Object>> listLecttureGrp(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return lectureDao.listLecttureGrp(paramMap);
	}

	@Override
	public Map<String, Object> selectLectureDtl(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return lectureDao.selectLectureDtl(paramMap);
	}
	
	
}
