package kr.kosmo.jobkorea.supportA.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportA.model.AdviceMgtDtlModel;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtDtlModel2;
import kr.kosmo.jobkorea.supportA.model.AdviceMgtModel;

public interface AdviceMgtService {

	/** 상담내용 목록 조회 */
	public List<AdviceMgtModel> listAdviceMgt(Map<String, Object> paramMap) throws Exception;
	
	/** 상담내용 목록 카운트 조회 */
	public int countListAdviceMgt(Map<String, Object> paramMap) throws Exception;
	
	/** 상담내용 단건 조회 */
	public AdviceMgtModel selectAdviceMgt(Map<String, Object> paramMap) throws Exception;
	

	/** 상세코드 목록 조회 */
	public List<AdviceMgtDtlModel> listAdviceMgtDtl(Map<String, Object> paramMap) throws Exception;
	
	/** 상세코드 목록 조회 */
	public List<AdviceMgtDtlModel2> listAdviceMgtDtl2(Map<String, Object> paramMap) throws Exception;
	
	/** 상담내용 목록 카운트 조회 */
	public int countListAdviceMgtDtl(Map<String, Object> paramMap) throws Exception;
	
	public int countListAdviceMgtDtl2(Map<String, Object> paramMap) throws Exception;
	
	/** 상세코드 단건 조회 */
	public AdviceMgtDtlModel selectAdviceMgtDtl(Map<String, Object> paramMap) throws Exception;
	
	/** 상담내용 저장 */
	public int insertAdviceMgt(Map<String, Object> paramMap) throws Exception;
	/** 상담내용 수정 */
	public int updateAdviceMgt(Map<String, Object> paramMap) throws Exception;
	/** 상담내용 삭제 */
	public int deleteAdviceMgt(Map<String, Object> paramMap) throws Exception;
	
}
