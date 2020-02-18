package kr.kosmo.jobkorea.stats.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.stats.dao.DateFoodSaleDao;

@Service
public class DateFoodSaleServiceImpl implements DateFoodSaleService {
	
	 @Autowired
	 DateFoodSaleDao dateFoodSaleDao;

	@Override
	public List<Map<String, Object>> dateFoodSaleList(Map<String, Object> paramMap) throws Exception {
		List<Map<String, Object>> dateFoodSaleList=dateFoodSaleDao.dateFoodSaleList(paramMap);
		return dateFoodSaleList;
	}

	@Override
	public int countDateFoodSaleList(Map<String, Object> paramMap) throws Exception {
		 int countDateFoodSaleList=dateFoodSaleDao.countDateFoodSaleList(paramMap);
		return countDateFoodSaleList;
	}

}
