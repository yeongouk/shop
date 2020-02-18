package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.FoodRankingDao;


@Service
public class FoodRankingServiceImpl implements FoodRankingService {

	@Autowired
	FoodRankingDao foodRankingDao;
	
	@Override
	public List<Map<String, Object>> foodRankingList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> foodRankingList = foodRankingDao.foodRankingList(paramMap);
		return foodRankingList;
	}

	@Override
	public int countFoodRankingList(Map<String, Object> paramMap) throws Exception {
		int countFoodRankingList=foodRankingDao.countFoodRankingList(paramMap);
		return countFoodRankingList;
	}

}
