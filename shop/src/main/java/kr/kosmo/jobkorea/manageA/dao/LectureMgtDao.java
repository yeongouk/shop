package kr.kosmo.jobkorea.manageA.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageA.model.LectureMgtCodModel;
import kr.kosmo.jobkorea.manageA.model.LectureMgtDtlCodModel;

public interface LectureMgtDao {

	/** 수강목록 목록 조회 */
	public List<LectureMgtCodModel> listLectureMgt(Map<String, Object> paramMap);
	
	/** 수강목록 목록 카운트 조회 */
	public int countListLectureMgt(Map<String, Object> paramMap);
	
	/** 수강목록 단건 조회 */
	public LectureMgtCodModel selectLectureMgt(Map<String, Object> paramMap);
	
	/** 수강목록 저장 */
	public int insertLectureMgt(Map<String, Object> paramMap);
	
	/** 수강목록 수정 */
	public int updateLectureMgt(Map<String, Object> paramMap);
	
	/** 수강목록 삭제 */
	public int deleteLectureMgt(Map<String, Object> paramMap);
	
	/** 수강인원목록 목록 조회 */
	public List<LectureMgtDtlCodModel> listLectureMgtDtl(Map<String, Object> paramMap);
	
	/** 수강목록 목록 카운트 조회 */
	public int countListLectureMgtDtl(Map<String, Object> paramMap);
	
	/** 수강인원목록 단건 조회 */
	public LectureMgtDtlCodModel selectLectureMgtDtl(Map<String, Object> paramMap);

	

	
}
