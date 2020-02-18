package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.CurInsuffStockDao;

@Service
public class CurInsuffStockServiceImpl implements CurInsuffStockService {

	@Autowired
	CurInsuffStockDao curInsuffStockDao;
	
	@Override
	public List<Map<String, Object>> curInsuffStockList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> curInsuffStockList=curInsuffStockDao.curInsuffStockList(paramMap);
		return curInsuffStockList;
	}

	@Override
	public int countCurInsuffStockList(Map<String, Object> paramMap) throws Exception {
		int countCurInsuffStockList = curInsuffStockDao.countCurInsuffStockList(paramMap);
		return countCurInsuffStockList;
	}


}
