package kr.kosmo.jobkorea.manageD.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.manageD.dao.EvaluationMgtKYLDao;
import kr.kosmo.jobkorea.manageD.model.EvaluationMgtKYLModel;



@Service
public class EvaluationMgtKYLServiceImpl implements EvaluationMgtKYLService {
	
	@Autowired
	EvaluationMgtKYLDao evaluationMgtKYLDao;

	@Override
	public List<EvaluationMgtKYLModel> evaluationMgtList(Map<String, Object> paramMap) {
		List<EvaluationMgtKYLModel> evaluationMgtList = evaluationMgtKYLDao.evaluationMgtList(paramMap);
		return evaluationMgtList;
	}

	@Override
	public int evaluationMgtListCnt(Map<String, Object> paramMap) {
		int evaluationMgtListCnt = evaluationMgtKYLDao.evaluationMgtListCnt(paramMap);
		return evaluationMgtListCnt;
	}

	@Override
	public List<EvaluationMgtKYLModel> studentList(Map<String, Object> paramMap) {
		List<EvaluationMgtKYLModel> studentList = evaluationMgtKYLDao.studentList(paramMap);
		return studentList;
	}

	@Override
	public int countStudentList(Map<String, Object> paramMap) {
		int countStudentList = evaluationMgtKYLDao.countStudentList(paramMap);
		return countStudentList;
	}

	@Override
	public EvaluationMgtKYLModel selectLecture(Map<String, Object> paramMap) {
		EvaluationMgtKYLModel selectLecture=evaluationMgtKYLDao.selectLecture(paramMap);
		return selectLecture;
	}

	@Override
	public EvaluationMgtKYLModel selectStudent(Map<String, Object> paramMap) {
		EvaluationMgtKYLModel selectStudent=evaluationMgtKYLDao.selectStudent(paramMap);
		return selectStudent;
	}

	@Override
	public int insertEvaluation(Map<String, Object> paramMap) {
		int insertEvaluation=evaluationMgtKYLDao.insertEvaluation(paramMap);
		return insertEvaluation;
	}

	@Override
	public int updateEvaluation(Map<String, Object> paramMap) {
		int updateEvaluation=evaluationMgtKYLDao.updateEvaluation(paramMap);
		return updateEvaluation;
	}

	@Override
	public int deleteEvaluation(Map<String, Object> paramMap) {
		int deleteEvaluation=evaluationMgtKYLDao.deleteEvaluation(paramMap);
		return deleteEvaluation;
	}

}