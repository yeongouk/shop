package kr.kosmo.jobkorea.manageD.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageD.model.HomeworkModel;
import kr.kosmo.jobkorea.system.model.ComnCodUtilModel;
import kr.kosmo.jobkorea.system.model.ComnDtlCodModel;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;

public interface WorkService {
	
	/** 과제 목록 조회*/
	public List<HomeworkModel> listHomework(Map<String, Object> paramMap)throws Exception;
	
	/** 과제 모록 카운트 조회*/
	public int countListHomework(Map<String, Object> paramMap)throws Exception;

	/** 과제 상제 조회*/
	public HomeworkModel selectHomeworkDtl(Map<String, Object> map)throws Exception;

	/** 과제 다운로드*/
	public HomeworkModel documentDown(Map<String, Object> paramMap)throws Exception;

	
	
	



}
