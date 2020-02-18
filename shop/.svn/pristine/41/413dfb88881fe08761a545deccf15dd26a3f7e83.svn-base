package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.UnpaidDao;


@Service
public class UnpaidServiceImpl implements UnpaidService {
	
	@Autowired
	UnpaidDao unpaidDao;

	@Override
	public List<Map<String, Object>> unpaidList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> unpaidList = unpaidDao.unpaidList(paramMap);
		return unpaidList;
	}

	@Override
	public int countUnpaidList(Map<String, Object> paramMap) throws Exception {
		int countUnpaidList=unpaidDao.countUnpaidList(paramMap);
		return countUnpaidList;
	}

}
