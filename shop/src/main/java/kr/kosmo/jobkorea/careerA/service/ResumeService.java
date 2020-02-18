package kr.kosmo.jobkorea.careerA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.careerA.model.ResumeModel;
import kr.kosmo.jobkorea.supportD.model.NoticeDModel;

public interface ResumeService {

	//강의과정 목록 조회
	public List<ResumeModel> lectureClassList(Map<String, Object> paramMap) throws Exception;
	
	//강의과정 목록 카운트
	public int lectureClassListCnt(Map<String, Object> paramMap) throws Exception;
	
	//강의과정 학생명 상세 조회
	public List<ResumeModel> lectureClassListDtl(Map<String, Object> paramMap) throws Exception;
	//강의과정 학생명 상세 조회
	public List<ResumeModel> ResumeList(Map<String, Object> paramMap) throws Exception;

	//강의과정 학생명 상세 카운트
	public int lectureClassListDtlCnt(Map<String, Object> paramMap) throws Exception;
	
	//팝업모달창 이력서 조회
	ResumeModel detailResume(Map<String, Object> paramMap);
}
