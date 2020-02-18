package kr.kosmo.jobkorea.manageF.dao;

import java.util.List;
import java.util.Map;

import kr.kosmo.jobkorea.manageF.model.ToolinfoModel;

public interface ToolinfoDAO {

	void insertRoom(Map<String, Object> reqParam);

	List<Map<String, Object>> selectWareList(Map<String, Object> wareMap);

	int cntWareInfoList(Map<String, Object> wareMap);

	void insertWareInfo(Map<String, Object> reqParam);

	ToolinfoModel readOneWare(Map<String, Object> reqParam);

	void updateWareInfo(Map<String, Object> wareMap);

	void deleteWareInfo(Map<String, Object> wareMap);



}
