package kr.kosmo.jobkorea.stats.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.stats.dto.StatsDTO;

public interface StatsDAO {
	
	public List<StatsDTO> getBoardList(Map<String, Object> map);
	
	
	  public int getBoardListCnt(Map<String, Object> map);
	  
	  public StatsDTO selectBoardDtl(Map<String, Object> map);
	  
	  public void BoardReg(Map<String, String> map);
	  
	  public void BoardUpdate(Map<String, String> map);
	  
	  public void BoardDelete(Map<String, String> map);
	 
}
