package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

public interface CurInsuffStockService {

	public List<Map<String, Object>> curInsuffStockList(Map<String, Object> paramMap) throws Exception;

	public int countCurInsuffStockList(Map<String, Object> paramMap)  throws Exception;

	

}
