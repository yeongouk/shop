package kr.kosmo.jobkorea.statistics.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.statistics.model.FailedNumModel;

public interface FailedService {

	// 과락인원 목록 조회
	public List<FailedNumModel> listFailedNum(Map<String, Object> paramMap) throws Exception;

	// 과락인원 목록 카운트 조회
	public int countListFailedNum(Map<String, Object> paramMap) throws Exception;

	// 과락인원 목록 전체조회(그래프 출력용)
	public List<FailedNumModel> listFailedNumForGraph(Map<String, Object> paramMap) throws Exception;

}
