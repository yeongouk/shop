package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageC.dao.SurveyCDAO;

@Service
public class SurveyCServiceImpl implements SurveyCService {
	
	@Autowired
	SurveyCDAO dao;
	
	@Override
	public List<Map<String, Object>> listLectureGrp(Map<String, Object> paramMap) {
		
		List<Map<String, Object>> listLectureGrp = dao.listLectureGrp(paramMap);
		
		
		return listLectureGrp;
		
		/*
		 * List<LectureGrpModel> listLectureGrp = lectureDao.listLectureGrp(paramMap);
		 * 
		 * return listLectureGrp;
		 */

	}

	@Override
	public int countListLectureGrp(Map<String, Object> paramMap) {
		
		int countListLectureGrp = dao.countListLectureGrp(paramMap);
		return countListLectureGrp;
		
	}

	@Override
	public Map<String, Object> selectSurveyReg(Map<String, Object> paramMap) throws Exception {
		
		Map<String, Object> selectSurveyRegModel = dao.selectSurveyReg(paramMap);
		return selectSurveyRegModel;
		
	}

	@Override
	public void insertSurveyReg(Map<String, Object> paramMap) throws Exception {
		dao.insertSurveyReg(paramMap);
		
	}
	

}
