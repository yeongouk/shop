package kr.kosmo.jobkorea.manageD.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageD.dao.LectureHDHDao;
import kr.kosmo.jobkorea.manageD.model.LectureGrpModel;

@Service
public class LectureHDHServiceImpl implements LectureHDHService {

	@Autowired
	LectureHDHDao lectureDao;
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Override
	public List<LectureGrpModel> listLectureGrp(Map<String, Object> paramMap) {
		
		List<LectureGrpModel> listLectureGrp = lectureDao.listLectureGrp(paramMap);
		return listLectureGrp;

	}

	@Override
	public int countListLectureGrp(Map<String, Object> paramMap) {
		
		int countListLectureGrp = lectureDao.countListLectureGrp(paramMap);
		return countListLectureGrp;
		
	}

	@Override
	public LectureGrpModel selectLectureGrp(Map<String, Object> paramMap) {
		
		LectureGrpModel lectureGrpModel = lectureDao.selectLectureGrp(paramMap);
		return lectureGrpModel;
		
	}

	@Override
	public int updateLectureGrp(Map<String, Object> paramMap) {
		
		int ret = lectureDao.updateLectureGrp(paramMap);
		return ret;
		
	}
	
	
}
