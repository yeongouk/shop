package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.CtmBuyRankingDao;

@Service
public class CtmBuyRankingServiceImpl implements CtmBuyRankingService {

	@Autowired
	CtmBuyRankingDao ctmBuyRankingDao;
	
	@Override
	public List<Map<String, Object>> ctmBuyRankingList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> ctmBuyRankingList = ctmBuyRankingDao.ctmBuyRankingList(paramMap);
		return ctmBuyRankingList;
	}

	@Override
	public int countCtmBuyRankingList(Map<String, Object> paramMap) throws Exception {
		int countCtmBuyRankingList = ctmBuyRankingDao.countCtmBuyRankingList(paramMap);
		return countCtmBuyRankingList;
	}

}
