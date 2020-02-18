package kr.kosmo.jobkorea.manageA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageA.model.ExsubjectMgtDtlModel;
import kr.kosmo.jobkorea.manageA.model.ExsubjectMgtModel;

public interface ExsubjectMgtService {

	/** 수강목록 목록 조회 */
	public List<ExsubjectMgtModel> listExsubjectMgt(Map<String, Object> paramMap) throws Exception;
	
	/** 수강목록 목록 카운트 조회 */
	public int countListExsubjectMgt(Map<String, Object> paramMap) throws Exception;
	
	/** 수강인원 목록 조회 */
	public List<ExsubjectMgtDtlModel> listExsubjectMgtDtl(Map<String, Object> paramMap) throws Exception;
	
	/** 수강목록 목록 카운트 조회 */
	public int countListExsubjectMgtDtl(Map<String, Object> paramMap) throws Exception;
	
	
}
