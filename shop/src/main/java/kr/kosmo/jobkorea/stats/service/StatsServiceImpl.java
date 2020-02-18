package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.StatsDAO;
import kr.kosmo.jobkorea.stats.dto.StatsDTO;

@Service
public class StatsServiceImpl implements StatsService {

@Autowired
StatsDAO dao;

	@Override
	public List<StatsDTO> getBoardList(Map<String, Object> map) {
		List<StatsDTO> list = dao.getBoardList(map);
		return list;
	}
	
	  @Override public int countListBoard(Map<String, Object> map) { int
	  boardListCnt = dao.getBoardListCnt(map); return boardListCnt; }
	  
	  
	  @Override public StatsDTO selectBoardDtl(Map<String, Object> map) throws
	  Exception { StatsDTO list = dao.selectBoardDtl(map); return list; }
	  
	  @Override public void BoardReg(Map<String, String> map) throws Exception {
	  dao.BoardReg(map);
	  
	  }
	  
	  @Override public void BoardUpdate(Map<String, String> map) throws Exception {
	  dao.BoardUpdate(map);
	  
	  }
	  
	  @Override public void BoardDelete(Map<String, String> map) throws Exception {
	  dao.BoardDelete(map);
	  
	  }
	 

	

}
