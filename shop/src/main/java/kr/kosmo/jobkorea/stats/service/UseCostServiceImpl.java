package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import kr.kosmo.jobkorea.stats.dao.UseCostDAO;

@Service
public class UseCostServiceImpl implements UseCostService {

	@Autowired
	UseCostDAO UseCostDAO;
	
	@Override
	public List<Map<String, Object>> UseCostList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> UseCostList = UseCostDAO.UseCostList(paramMap);
		return UseCostList;
	}

	@Override
	public int countUseCostDtlList(Map<String, Object> paramMap) throws Exception {
		int countUseCostDtlList = UseCostDAO.countUseCostDtlList(paramMap);
		return countUseCostDtlList;
	}

}
