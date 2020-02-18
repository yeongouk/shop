package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.stats.dto.StatsDTO;

public interface StatsService {
	
	List<StatsDTO> getBoardList(Map<String, Object> map);
	
	
	  int countListBoard(Map<String, Object> map);
	  
	  StatsDTO selectBoardDtl(Map<String, Object> map) throws Exception;
	  
	  public void BoardReg(Map<String, String> map) throws Exception;
	  
	  public void BoardUpdate(Map<String, String> map) throws Exception;
	  
	  public void BoardDelete(Map<String, String> map) throws Exception;
	 
}
