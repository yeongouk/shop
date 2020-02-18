package kr.kosmo.jobkorea.careerA.dao;

import java.util.List;
import java.util.Map;


import kr.kosmo.jobkorea.careerA.model.CareerMgtModel;

public interface CareerMgtDao {
	

	public int careerTotalCntMgt(Map<String, Object> paramMap) throws Exception;


	public List<CareerMgtModel> selectCareerListMgt(Map<String, Object> paramMap) throws Exception;


	public CareerMgtModel detailCareerMgt(Map<String, Object> paramMap) throws Exception;


	public int numPlusMgt() throws Exception;

    
	public int insertCareerMgt(Map<String, Object> paramMap) throws Exception;


	public int updateCareerMgt(Map<String, Object> paramMap) throws Exception;


	public int deleteCareerMgt(Map<String, Object> paramMap) throws Exception;

	/* public int viewcount(Map<String, Object> paramMap) throws Exception; */
       
       






}
