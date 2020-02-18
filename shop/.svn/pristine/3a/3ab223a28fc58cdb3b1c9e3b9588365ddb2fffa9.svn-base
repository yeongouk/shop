package kr.kosmo.jobkorea.careerA.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.careerA.dao.CareerMgtDao;
import kr.kosmo.jobkorea.careerA.model.CareerMgtModel;

@Service
public class CareerMgtServiceImpl implements CareerMgtService {

	@Autowired
	CareerMgtDao careerMgtDao;
	
	@Override
	public List<CareerMgtModel> careerList(Map<String, Object> paramMap) throws Exception {
		
      List<CareerMgtModel> careerList = careerMgtDao.selectCareerListMgt(paramMap);
		
		
		return careerList;
	}

	@Override
	public int careerTotalCnt(Map<String, Object> paramMap) throws Exception {
		
         int totalCnt = careerMgtDao.careerTotalCntMgt(paramMap);
		
		return totalCnt;
	}

	@Override
	public CareerMgtModel detailCareer(Map<String, Object> paramMap) throws Exception {
	
		// 상세정보 가져오기 
		CareerMgtModel detailCareer = careerMgtDao.detailCareerMgt(paramMap);
	
		/* int viewcount = careerMgtDao.viewcount(paramMap); */
			
		return detailCareer;
	}

	@Override
	public int insertCareerMgt(Map<String, Object> paramMap) throws Exception{
       
		int numResult = careerMgtDao.numPlusMgt();
		paramMap.put("nt_no", numResult); // 번호 여기에 추가 
		int resultCnt = careerMgtDao.insertCareerMgt(paramMap);
		
		return resultCnt;
	}

	@Override
	public int updateCareerMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = careerMgtDao.updateCareerMgt(paramMap);
		
		return resultCnt;
	}

	@Override
	public int deleteCareerMgt(Map<String, Object> paramMap) throws Exception{
		
		int resultCnt = careerMgtDao.deleteCareerMgt(paramMap);
		
		return resultCnt;
	}



}
