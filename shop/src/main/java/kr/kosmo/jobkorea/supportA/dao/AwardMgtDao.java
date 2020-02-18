package kr.kosmo.jobkorea.supportA.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.supportA.model.AwardMgtDtlModel;
import kr.kosmo.jobkorea.supportA.model.AwardMgtDtlModel2;
import kr.kosmo.jobkorea.supportA.model.AwardMgtModel;

public interface AwardMgtDao {

	/** 그룹코드 목록 조회 */
	public List<AwardMgtModel> listAwardMgt(Map<String, Object> paramMap);

	/** 그룹코드 목록 카운트 조회 */
	public int countListAwardMgt(Map<String, Object> paramMap);

	/** 그룹코드 단건 조회 */
	public AwardMgtModel selectAwardMgt(Map<String, Object> paramMap);


	/** 상세코드 목록 조회 */
	public List<AwardMgtDtlModel> listAwardMgtDtl(Map<String, Object> paramMap);
	
	/** 상세코드 목록 조회 */
	public List<AwardMgtDtlModel2> listAwardMgtDtl2(Map<String, Object> paramMap);

	/** 그룹코드 목록 카운트 조회 */
	public int countListAwardMgtDtl(Map<String, Object> paramMap);
	
	/** 그룹코드 목록 카운트 조회222 */
	public int countListAwardMgtDtl2(Map<String, Object> paramMap);

	/** 상세코드 단건 조회 */
	public AwardMgtDtlModel selectAwardMgtDtl(Map<String, Object> paramMap);
	
	
	
	public int insertAwardMgt(Map<String, Object> paramMap) throws Exception;


	public int updateAwardMgt(Map<String, Object> paramMap) throws Exception;


	public int deleteAwardMgt(Map<String, Object> paramMap) throws Exception;


}
