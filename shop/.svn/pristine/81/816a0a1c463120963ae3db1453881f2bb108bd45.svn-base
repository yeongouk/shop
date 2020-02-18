package kr.kosmo.jobkorea.system.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.system.dao.HoliMgrDao;
import kr.kosmo.jobkorea.system.model.HoliMgrModel;

@Service
public class HoliMgrServiceImpl implements HoliMgrService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	HoliMgrDao holiMgrDao;
	
	/** 공휴일 목록 조회 */
	public List<HoliMgrModel> listHoli(Map<String, Object> paramMap) throws Exception{
		List<HoliMgrModel> listHoli  = holiMgrDao.listHoli(paramMap);
		
		return listHoli; 
	}
	
	/** 공유일 정보 저장 */
	public int saveHoli(Map<String, Object> paramMap) throws Exception{
		int ret = holiMgrDao.saveHoli(paramMap);
		return ret;
	}
}
