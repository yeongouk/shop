package kr.kosmo.jobkorea.stats.dao;

import java.util.List;
import java.util.Map;

public interface FoodRankingDao {

	public List<Map<String, Object>> foodRankingList(Map<String, Object> paramMap) throws Exception;

	public int countFoodRankingList(Map<String, Object> paramMap)throws Exception;

}
