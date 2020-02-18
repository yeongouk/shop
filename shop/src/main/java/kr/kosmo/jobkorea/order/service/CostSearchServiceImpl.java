package kr.kosmo.jobkorea.order.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.order.dao.CostSearchDao;
import kr.kosmo.jobkorea.order.model.CostSearchModel;



@Service
public class CostSearchServiceImpl implements CostSearchService {

	@Autowired
	CostSearchDao costSearchDao;
	
	@Override
	public List<Map<String, Object>> costSearchList(Map<String, Object> paramMap) throws Exception {
	  List<Map<String, Object>> costSearchList = costSearchDao.costSearchList(paramMap);
		
		return costSearchList;
	}

	@Override
	public int countListCostSearch(Map<String, Object> paramMap) throws Exception {
       int totalCount = costSearchDao.countListCostSearch(paramMap);
		
		return totalCount;
	}

}
