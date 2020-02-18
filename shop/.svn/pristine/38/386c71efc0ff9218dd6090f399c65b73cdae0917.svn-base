package kr.kosmo.jobkorea.statistics.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.statistics.model.FailedNumModel;

public interface FailedNumDao {

	// 과락인원 목록 조회
	List<FailedNumModel> listFailedNum(Map<String, Object> paramMap);

	// 과락인원 목록 카운트 조회
	int countListFailedNum(Map<String, Object> paramMap);

	// 과락인원 목록 전체조회(그래프 출력용)
	List<FailedNumModel> listFailedNumForGraph(Map<String, Object> paramMap);
	
}
