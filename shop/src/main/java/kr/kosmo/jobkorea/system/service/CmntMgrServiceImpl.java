package kr.kosmo.jobkorea.system.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kosmo.jobkorea.system.dao.CmntMgrDao;
import kr.kosmo.jobkorea.system.model.CmntMgrModel;

@Service
public class CmntMgrServiceImpl implements CmntMgrService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	CmntMgrDao cmntMgrDao;
	
	/** 커뮤니티 목록 조회 */
	public List<CmntMgrModel> listCmnt(Map<String, Object> paramMap) throws Exception {
		
		List<CmntMgrModel> listCmnt = cmntMgrDao.listCmnt(paramMap);
		
		return listCmnt;
	}
	
	/** 커뮤니티 단건 조회 */
	public CmntMgrModel selectCmnt(Map<String, Object> paramMap) throws Exception {
		CmntMgrModel CmntModel = cmntMgrDao.selectCmnt(paramMap);
		return CmntModel;
	}

	/** 커뮤니티 저장 */
	public int insertCmnt(Map<String, Object> paramMap) throws Exception {
		int ret = cmntMgrDao.insertCmnt(paramMap);//커뮤니티 저장
		return ret;
	}

	/** 커뮤니티 수정 */
	public int updateCmnt(Map<String, Object> paramMap) throws Exception {
		int ret = cmntMgrDao.updateCmnt(paramMap); // 커뮤니티 수정 
		return ret;
	}

	/** 커뮤니티 삭제 */
	public int deleteCmnt(Map<String, Object> paramMap) throws Exception {
		int ret = cmntMgrDao.deleteCmnt(paramMap);
		return ret;
	}
}
