package kr.kosmo.jobkorea.stats.dao;

import java.util.List;
import java.util.Map;

public interface CtmBuyRankingDao {

	public List<Map<String, Object>> ctmBuyRankingList(Map<String, Object> paramMap) throws Exception;

	public int countCtmBuyRankingList(Map<String, Object> paramMap) throws Exception;

}
