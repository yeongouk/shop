package kr.kosmo.jobkorea.manageD.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageD.model.HomeworkModel;
import kr.kosmo.jobkorea.order.model.OrderModel;
import kr.kosmo.jobkorea.system.model.ComnGrpCodModel;

public interface HomeworkrDao {
	
	/**과제 목록 조회*/
	public List<HomeworkModel> listHomework(Map<String, Object> paramMap);

	/**과제 목록 카운트 조회*/
	public int countListHomework(Map<String, Object> paramMap);

	/**과제 상세 조회*/
	public HomeworkModel selectHomeworkDtl(Map<String, Object> map);

	/** 과제 다운로드*/
	public HomeworkModel documentDown(Map<String, Object> paramMap);

	
	
	
	
}
