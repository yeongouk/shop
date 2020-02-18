package kr.kosmo.jobkorea.manageC.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.kosmo.jobkorea.manageC.model.testLJKModel;

public interface ExaminationLJKService {

	public List<testLJKModel> listExam(Map<String, Object> paramMap) throws Exception;

	public int countExamlist(Map<String, Object> paramMap) throws Exception;
	
	public List<testLJKModel> selectProblem(Map<String, Object> paramMap) throws Exception;
	
	public int countProblem(Map<String, Object> paramMap) throws Exception;
	
	public void testReg(Map<String, Object> map, HttpServletRequest request) throws Exception;
}