package kr.kosmo.jobkorea.manageF.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.kosmo.jobkorea.manageF.dao.ToolinfoDAO;
import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;


@Repository
public class ToolinfoServiceImpl implements ToolinfoService {

	@Autowired
	ToolinfoDAO dao;
	
	@Override
	public List<Map<String, Object>> selectWareList(Map<String, Object> wareMap) {
		return dao.selectWareList(wareMap);
	}

	@Override
	public int cntWareInfoList(Map<String, Object> wareMap) {
		return dao.cntWareInfoList(wareMap);
	}

	@Override
	public void insertWareInfo(Map<String, Object> reqParam) {
		dao.insertWareInfo(reqParam);
	}

	@Override
	public ToolinfoModel readOneWare(Map<String, Object> reqParam) {
		return dao.readOneWare(reqParam);
	}

	@Override
	public void updateWareInfo(Map<String, Object> reqParam) {
		dao.updateWareInfo(reqParam);
	}

	@Override
	public void deleteWareInfo(Map<String, Object> reqParam) {
		dao.deleteWareInfo(reqParam);
	}


	
	
	


}
