package kr.kosmo.jobkorea.stats.dao;

import java.util.List;
import java.util.Map;

public interface CtmSpecProCostDao {

	public List<Map<String, Object>> ctmSpecProCostList(Map<String, Object> paramMap) throws Exception;

	public int countCtmSpecProCostList(Map<String, Object> paramMap) throws Exception;

}
