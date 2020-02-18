package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageC.dao.ExaminationLJKDao;
import kr.kosmo.jobkorea.manageC.model.testLJKModel;
import kr.kosmo.jobkorea.supportC.dao.LectureDao;

@Service
public class ExaminationLJKServiceImpl implements ExaminationLJKService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	ExaminationLJKDao examinationLJKdao;
	
	@Override
	public List<testLJKModel> listExam(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return examinationLJKdao.listExam(paramMap);
	}

	@Override
	public int countExamlist(Map<String, Object> paramMap) throws Exception {
		int totalCount = examinationLJKdao.countExamlist(paramMap);
		
		return totalCount;
	}

	@Override
	public List<testLJKModel> selectProblem(Map<String, Object> paramMap) throws Exception {
		List<testLJKModel> list = examinationLJKdao.selectProblem(paramMap);
		return list;
	}

	@Override
	public int countProblem(Map<String, Object> paramMap) throws Exception {
		int totalCount = examinationLJKdao.countProblem(paramMap);
		
		return totalCount;
	}

	@Override
	public void testReg(Map<String, Object> map, HttpServletRequest request) throws Exception {
		examinationLJKdao.testReg(map);
		return;
	}

	
}
