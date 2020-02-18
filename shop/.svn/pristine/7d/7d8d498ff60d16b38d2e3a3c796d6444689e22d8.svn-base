package kr.kosmo.jobkorea.careerA.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.careerA.model.ResumeModel;
import kr.kosmo.jobkorea.supportD.model.NoticeDModel;


public interface ResumeDao {

	// 강의과정명 목록 조회
	public List<ResumeModel> lectureClassList(Map<String, Object> paramMap);
	
	//강의과정명 목록 카운트 
	public int lectureClassListCnt(Map<String, Object> paramMap);

	//강의과정명 학생명 상세 조회
	public List<ResumeModel> lectureClassListDtl(Map<String, Object> paramMap);
	
	public List<ResumeModel> ResumeList(Map<String, Object> paramMap);

	//강의과정명 학생명 상세 목록 카운트
	public int lectureClassListDtlCnt(Map<String, Object> paramMap);
	
	//모달 팝업 - 이력서
	ResumeModel detailResume(Map<String, Object> paramMap);
}
