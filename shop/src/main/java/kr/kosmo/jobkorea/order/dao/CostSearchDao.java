package kr.kosmo.jobkorea.order.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.order.model.CostSearchModel;

public interface CostSearchDao {

	public List<Map<String, Object>> costSearchList(Map<String, Object> paramMap) throws Exception;

	public int countListCostSearch(Map<String, Object> paramMap) throws Exception;

}
