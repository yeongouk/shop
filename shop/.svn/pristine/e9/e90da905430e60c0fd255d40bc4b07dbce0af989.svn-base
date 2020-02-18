package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.CtmSpecProCostDao;

@Service
public class CtmSpecProCostServiceImpl implements CtmSpecProCostService {

	@Autowired
	CtmSpecProCostDao ctmSpecProCostDao;
	
	@Override
	public List<Map<String, Object>> ctmSpecProCostList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> ctmSpecProCostList=ctmSpecProCostDao.ctmSpecProCostList(paramMap);
		return ctmSpecProCostList;
	}

	@Override
	public int countCtmSpecProCostList(Map<String, Object> paramMap) throws Exception {
		int countCtmSpecProCostList=ctmSpecProCostDao.countCtmSpecProCostList(paramMap);
		return countCtmSpecProCostList;
	}

}
